
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/src/models/model_generator/sumunrealized.dart';
import 'package:quan_ly/src/models/model_generator/trans.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';

import '../../src/models/model_generator/home.dart';
import '../../src/models/model_generator/sumrealized.dart';
import '../../src/models/model_generator/unrealized.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'sumrealized_event.dart';
part 'sumrealized_state.dart';


class SumrealizedBloc extends Bloc<SumrealizedEvent, SumrealizedState>{
  final UserRepository userRepository;

  SumrealizedBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetSumrealizedState());

  @override
  Stream<SumrealizedState> mapEventToState(SumrealizedEvent event) async* {
    if (event is InitGetSumrealizedEvent) {
      yield* _getSumrealized();
    }
  }
  Stream<SumrealizedState> _getSumrealized() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingSumrealizedState();
      final response = await userRepository.getSumrealized();
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetSumrealizedState(response.data!);
      }
      else
        yield ErrorGetSumrealizedState(response.message ?? "");
    } catch (e) {
      yield ErrorGetSumrealizedState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static SumrealizedBloc of(BuildContext context) => BlocProvider.of<SumrealizedBloc>(context);
}