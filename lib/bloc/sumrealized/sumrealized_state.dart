part of 'sumrealized_bloc.dart';


abstract class SumrealizedState extends Equatable {

  @override
  List<Object?> get props => [];

  SumrealizedState();
}
class InitGetSumrealizedState extends SumrealizedState {}

class UpdateGetSumrealizedState extends SumrealizedState{
  DataSumrealized data;

  UpdateGetSumrealizedState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingSumrealizedState extends SumrealizedState {
}


class ErrorGetSumrealizedState extends SumrealizedState{
  final String msg;


  ErrorGetSumrealizedState(this.msg);

  @override
  List<Object> get props => [msg];
}