part of 'unrealized_own_bloc.dart';


abstract class UnrealizedOwnState extends Equatable {

  @override
  List<Object?> get props => [];

  UnrealizedOwnState();
}
class InitGetUnrealizedOwnState extends UnrealizedOwnState {}

class UpdateGetUnrealizedOwnState extends UnrealizedOwnState{

  DataUnrealizedOwn data;

  UpdateGetUnrealizedOwnState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingUnrealizedOwnState extends UnrealizedOwnState {
}


class ErrorGetUnrealizedOwnState extends UnrealizedOwnState{
  final String msg;


  ErrorGetUnrealizedOwnState(this.msg);

  @override
  List<Object> get props => [msg];
}