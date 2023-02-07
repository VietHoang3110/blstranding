part of 'realized_own_bloc.dart';


abstract class RealizedOwnState extends Equatable {

  @override
  List<Object?> get props => [];

  RealizedOwnState();
}
class InitGetRealizedOwnState extends RealizedOwnState {}

class UpdateGetRealizedOwnState extends RealizedOwnState{
  DataRealizedOwn data;

  UpdateGetRealizedOwnState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingRealizedOwnState extends RealizedOwnState {
}


class ErrorGetRealizedOwnState extends RealizedOwnState{
  final String msg;


  ErrorGetRealizedOwnState(this.msg);

  @override
  List<Object> get props => [msg];
}