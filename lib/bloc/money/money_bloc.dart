
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/src/models/model_generator/money.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'money_event.dart';
part 'money_state.dart';


class MoneyBloc extends Bloc<MoneyEvent, MoneyState>{
  final UserRepository userRepository;

  MoneyBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetMoneyState());

  @override
  Stream<MoneyState> mapEventToState(MoneyEvent event) async* {
    if (event is InitGetMoneyEvent) {
      yield* _getMoney(event.page, event.numOfRecords);
    }
  }
  Stream<MoneyState> _getMoney(int page, int numOfRecords) async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingMoneyState();
      final response = await userRepository.getMoney(page, numOfRecords);
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetMoneyState(response.data!);
      }
      else
        yield ErrorGetMoneyState(response.message ?? "");
    } catch (e) {
      yield ErrorGetMoneyState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static MoneyBloc of(BuildContext context) => BlocProvider.of<MoneyBloc>(context);
}