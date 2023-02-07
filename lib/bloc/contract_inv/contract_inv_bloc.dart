
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/models/model_generator/contract_inv.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'contract_inv_event.dart';
part 'contract_inv_state.dart';


class ContractInvBloc extends Bloc<ContractInvEvent, ContractInvState>{
  final UserRepository userRepository;

  ContractInvBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetContractInvState());

  @override
  Stream<ContractInvState> mapEventToState(ContractInvEvent event) async* {
    if (event is InitGetContractInvEvent) {
      yield* _getContractInv(event.page, event.numOfRecords);
    }
  }
  Stream<ContractInvState> _getContractInv(int page, int numOfRecords) async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingContractInvState();
      final response = await userRepository.getContractInv(page, numOfRecords);
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetContractInvState(response.data!);
      }
      else
        yield ErrorGetContractInvState(response.message ?? "");
    } catch (e) {
      yield ErrorGetContractInvState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ContractInvBloc of(BuildContext context) => BlocProvider.of<ContractInvBloc>(context);
}