part of 'realized_bloc.dart';


abstract class RealizedState extends Equatable {

  @override
  List<Object?> get props => [];

  RealizedState();
}
class InitGetRealizedState extends RealizedState {}

class UpdateGetRealizedState extends RealizedState{
  DataRealized data;

  UpdateGetRealizedState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingRealizedState extends RealizedState {
}


class ErrorGetRealizedState extends RealizedState{
  final String msg;


  ErrorGetRealizedState(this.msg);

  @override
  List<Object> get props => [msg];
}