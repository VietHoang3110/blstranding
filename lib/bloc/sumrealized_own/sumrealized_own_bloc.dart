
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/src/models/model_generator/sumunrealized.dart';
import 'package:quan_ly/src/models/model_generator/trans.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';

import '../../src/models/model_generator/home.dart';
import '../../src/models/model_generator/sumrealized.dart';
import '../../src/models/model_generator/sumrealized_own.dart';
import '../../src/models/model_generator/unrealized.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'sumrealized_own_event.dart';
part 'sumrealized_own_state.dart';


class SumrealizedOwnBloc extends Bloc<SumrealizedOwnEvent, SumrealizedOwnState>{
  final UserRepository userRepository;

  SumrealizedOwnBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetSumrealizedOwnState());

  @override
  Stream<SumrealizedOwnState> mapEventToState(SumrealizedOwnEvent event) async* {
    if (event is InitGetSumrealizedOwnEvent) {
      yield* _getSumrealizedOwn();
    }
  }
  Stream<SumrealizedOwnState> _getSumrealizedOwn() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingSumrealizedOwnState();
      final response = await userRepository.getSumrealizedOwn();
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetSumrealizedOwnState(response.data!);
      }
      else
        yield ErrorGetSumrealizedOwnState(response.message ?? "");
    } catch (e) {
      yield ErrorGetSumrealizedOwnState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static SumrealizedOwnBloc of(BuildContext context) => BlocProvider.of<SumrealizedOwnBloc>(context);
}