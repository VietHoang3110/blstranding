part of 'sumunrealized_bloc.dart';


abstract class SumunrealizedState extends Equatable {

  @override
  List<Object?> get props => [];

  SumunrealizedState();
}
class InitGetSumunrealizedState extends SumunrealizedState {}

class UpdateGetSumunrealizedState extends SumunrealizedState{
  DataSumunrealized data;

  UpdateGetSumunrealizedState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingSumunrealizedState extends SumunrealizedState {
}


class ErrorGetSumunrealizedState extends SumunrealizedState{
  final String msg;


  ErrorGetSumunrealizedState(this.msg);

  @override
  List<Object> get props => [msg];
}