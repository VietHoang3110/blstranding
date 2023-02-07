part of 'contract_inv_bloc.dart';


abstract class ContractInvState extends Equatable {

  @override
  List<Object?> get props => [];

  ContractInvState();
}
class InitGetContractInvState extends ContractInvState {}

class UpdateGetContractInvState extends ContractInvState{
  ContractInv? data;

  UpdateGetContractInvState(this.data);
  @override
  List<Object> get props => [data!];
}

class LoadingContractInvState extends ContractInvState {
}


class ErrorGetContractInvState extends ContractInvState{
  final String msg;


  ErrorGetContractInvState(this.msg);

  @override
  List<Object> get props => [msg];
}