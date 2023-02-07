part of 'sumunrealized_own_bloc.dart';


abstract class SumunrealizedOwnState extends Equatable {

  @override
  List<Object?> get props => [];

  SumunrealizedOwnState();
}
class InitGetSumunrealizedOwnState extends SumunrealizedOwnState {}

class UpdateGetSumunrealizedOwnState extends SumunrealizedOwnState{
  DataSumunrealizedOwn data;

  UpdateGetSumunrealizedOwnState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingSumunrealizedOwnState extends SumunrealizedOwnState {
}


class ErrorGetSumunrealizedOwnState extends SumunrealizedOwnState{
  final String msg;


  ErrorGetSumunrealizedOwnState(this.msg);

  @override
  List<Object> get props => [msg];
}