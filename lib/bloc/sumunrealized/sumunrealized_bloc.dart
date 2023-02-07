
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/src/models/model_generator/sumunrealized.dart';
import 'package:quan_ly/src/models/model_generator/trans.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';

import '../../src/models/model_generator/home.dart';
import '../../src/models/model_generator/unrealized.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'sumunrealized_event.dart';
part 'sumunrealized_state.dart';


class SumunrealizedBloc extends Bloc<SumunrealizedEvent, SumunrealizedState>{
  final UserRepository userRepository;

  SumunrealizedBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetSumunrealizedState());

  @override
  Stream<SumunrealizedState> mapEventToState(SumunrealizedEvent event) async* {
    if (event is InitGetSumunrealizedEvent) {
      yield* _getSumunrealized();
    }
  }
  Stream<SumunrealizedState> _getSumunrealized() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingSumunrealizedState();
      final response = await userRepository.getSumunrealized();
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetSumunrealizedState(response.data!);
      }
      else
        yield ErrorGetSumunrealizedState(response.message ?? "");
    } catch (e) {
      yield ErrorGetSumunrealizedState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static SumunrealizedBloc of(BuildContext context) => BlocProvider.of<SumunrealizedBloc>(context);
}