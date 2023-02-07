part of 'sumrealized_own_bloc.dart';


abstract class SumrealizedOwnState extends Equatable {

  @override
  List<Object?> get props => [];

  SumrealizedOwnState();
}
class InitGetSumrealizedOwnState extends SumrealizedOwnState {
}

class UpdateGetSumrealizedOwnState extends SumrealizedOwnState{
  DataSumrealizedOwn data;

  UpdateGetSumrealizedOwnState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingSumrealizedOwnState extends SumrealizedOwnState {
}


class ErrorGetSumrealizedOwnState extends SumrealizedOwnState{
  final String msg;


  ErrorGetSumrealizedOwnState(this.msg);

  @override
  List<Object> get props => [msg];
}