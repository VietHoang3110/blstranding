
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/models/model_generator/money_own.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'money_own_event.dart';
part 'money_own_state.dart';


class MoneyOwnBloc extends Bloc<MoneyOwnEvent, MoneyOwnState>{
  final UserRepository userRepository;

  MoneyOwnBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetMoneyOwnState());

  @override
  Stream<MoneyOwnState> mapEventToState(MoneyOwnEvent event) async* {
    if (event is InitGetMoneyOwnEvent) {
      yield* _getMoneyOwn(event.page, event.numOfRecords);
    }
  }

  List<DataTableMoneyOwn> dataTableUpdate = [];

  Stream<MoneyOwnState> _getMoneyOwn(int page, int numOfRecords) async* {
    LoadingApi().pushLoading();
    try {
      if(page==1){
        yield LoadingMoneyOwnState();
      }
      final response = await userRepository.getMoneyOwn(page, numOfRecords);
      if(response.code == BASE_URL.SUCCESS_200){
        // yield UpdateGetMoneyOwnState(response.data!);
        if(page==1){
          dataTableUpdate=response.data!.datatable!;
          yield UpdateGetMoneyOwnState(response.data!,response.data!.datatable!);
        }
        else{
          dataTableUpdate=[...dataTableUpdate,...response.data!.datatable!];
          yield UpdateGetMoneyOwnState(response.data!,dataTableUpdate);
        }
      }
      else
        yield ErrorGetMoneyOwnState(response.message ?? "");
    } catch (e) {
      yield ErrorGetMoneyOwnState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static MoneyOwnBloc of(BuildContext context) => BlocProvider.of<MoneyOwnBloc>(context);
}