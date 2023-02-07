
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/src/models/model_generator/trans.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';

import '../../src/models/model_generator/home.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'trans_event.dart';
part 'trans_state.dart';


class TransBloc extends Bloc<TransEvent, TransState>{
  final UserRepository userRepository;

  TransBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetTransState());

  @override
  Stream<TransState> mapEventToState(TransEvent event) async* {
    if (event is InitGetTransEvent) {
      yield* _getTrans(event.page, event.numOfRecords);
    }
  }
  Stream<TransState> _getTrans(int page, int numOfRecords) async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingTransState();
      final response = await userRepository.getTrans(page, numOfRecords);
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetTransState(response.data!);
      }
      else
        yield ErrorGetTransState(response.message ?? "");
    } catch (e) {
      yield ErrorGetTransState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static TransBloc of(BuildContext context) => BlocProvider.of<TransBloc>(context);
}