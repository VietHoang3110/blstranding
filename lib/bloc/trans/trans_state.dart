part of 'trans_bloc.dart';


abstract class TransState extends Equatable {

  @override
  List<Object?> get props => [];

  TransState();
}
class InitGetTransState extends TransState {}

class UpdateGetTransState extends TransState{
  DataTrans data;

  UpdateGetTransState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingTransState extends TransState {
}


class ErrorGetTransState extends TransState{
  final String msg;


  ErrorGetTransState(this.msg);

  @override
  List<Object> get props => [msg];
}