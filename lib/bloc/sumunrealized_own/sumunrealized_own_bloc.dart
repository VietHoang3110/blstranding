
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/src/models/model_generator/sumunrealized.dart';
import 'package:quan_ly/src/models/model_generator/trans.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';

import '../../src/models/model_generator/home.dart';
import '../../src/models/model_generator/sumunrealized_own.dart';
import '../../src/models/model_generator/unrealized.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'sumunrealized_own_event.dart';
part 'sumunrealized_own_state.dart';


class SumunrealizedOwnBloc extends Bloc<SumunrealizedOwnEvent, SumunrealizedOwnState>{
  final UserRepository userRepository;

  SumunrealizedOwnBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetSumunrealizedOwnState());

  @override
  Stream<SumunrealizedOwnState> mapEventToState(SumunrealizedOwnEvent event) async* {
    if (event is InitGetSumunrealizedOwnEvent) {
      yield* _getSumunrealizedOwn();
    }
  }
  Stream<SumunrealizedOwnState> _getSumunrealizedOwn() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingSumunrealizedOwnState();
      final response = await userRepository.getSumunrealizedOwn();
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetSumunrealizedOwnState(response.data!);
      }
      else
        yield ErrorGetSumunrealizedOwnState(response.message ?? "");
    } catch (e) {
      yield ErrorGetSumunrealizedOwnState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static SumunrealizedOwnBloc of(BuildContext context) => BlocProvider.of<SumunrealizedOwnBloc>(context);
}