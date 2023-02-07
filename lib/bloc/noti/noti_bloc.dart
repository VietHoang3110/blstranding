
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/models/model_generator/noti.dart';
import '../../src/src_index.dart';

part 'noti_event.dart';
part 'noti_state.dart';


class NotiBloc extends Bloc<NotiEvent, NotiState>{
  final UserRepository userRepository;

  NotiBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetNotiState());

  @override
  Stream<NotiState> mapEventToState(NotiEvent event) async* {
    if (event is InitGetNotiEvent) {
      yield* _getNoti(event.page, event.numOfRecords);
    }
  }
  Stream<NotiState> _getNoti(int page, int numOfRecords) async* {
    // LoadingApi().pushLoading();
    try {
      yield LoadingNotiState();
      final response = await userRepository.getNoti(page, numOfRecords);
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetNotiState(response.data!);
      }
      else
        yield ErrorGetNotiState(response.message ?? "");
    } catch (e) {
      yield ErrorGetNotiState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static NotiBloc of(BuildContext context) => BlocProvider.of<NotiBloc>(context);
}