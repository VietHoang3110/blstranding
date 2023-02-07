part of 'contract_inv_bloc.dart';

abstract class ContractInvEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ContractInvEvent();
}


class InitGetContractInvEvent extends ContractInvEvent {

  int page;
  int numOfRecords;

  InitGetContractInvEvent(this.page, this.numOfRecords);

  @override
  List<Object?> get props => [];
}


