
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/src/models/model_generator/realized.dart';
import 'package:quan_ly/src/models/model_generator/sumunrealized.dart';
import 'package:quan_ly/src/models/model_generator/trans.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';

import '../../src/models/model_generator/home.dart';
import '../../src/models/model_generator/unrealized.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'realized_event.dart';
part 'realized_state.dart';


class RealizedBloc extends Bloc<RealizedEvent, RealizedState>{
  final UserRepository userRepository;

  RealizedBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetRealizedState());

  @override
  Stream<RealizedState> mapEventToState(RealizedEvent event) async* {
    if (event is InitGetRealizedEvent) {
      yield* _getRealized(event.page, event.numOfRecords);
    }
  }
  Stream<RealizedState> _getRealized(int page, int numOfRecords) async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingRealizedState();
      final response = await userRepository.getRealized(page, numOfRecords);
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetRealizedState(response.data!);
      }
      else
        yield ErrorGetRealizedState(response.message ?? "");
    } catch (e) {
      yield ErrorGetRealizedState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static RealizedBloc of(BuildContext context) => BlocProvider.of<RealizedBloc>(context);
}