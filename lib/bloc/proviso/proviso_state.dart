part of 'proviso_bloc.dart';


abstract class ProvisoState extends Equatable {

  @override
  List<Object?> get props => [];

  ProvisoState();
}
class InitGetProvisoState extends ProvisoState {}

class UpdateGetProvisoState extends ProvisoState{
  Data data;

  UpdateGetProvisoState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingProvisoState extends ProvisoState {
}


class ErrorGetProvisoState extends ProvisoState{
  final String msg;


  ErrorGetProvisoState(this.msg);

  @override
  List<Object> get props => [msg];
}