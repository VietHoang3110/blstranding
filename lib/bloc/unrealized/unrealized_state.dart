part of 'unrealized_bloc.dart';


abstract class UnrealizedState extends Equatable {

  @override
  List<Object?> get props => [];

  UnrealizedState();
}
class InitGetUnrealizedState extends UnrealizedState {}

class UpdateGetUnrealizedState extends UnrealizedState{
  DataUnrealized data;

  UpdateGetUnrealizedState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingUnrealizedState extends UnrealizedState {
}


class ErrorGetUnrealizedState extends UnrealizedState{
  final String msg;


  ErrorGetUnrealizedState(this.msg);

  @override
  List<Object> get props => [msg];
}