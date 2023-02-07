part of 'trans_own_bloc.dart';


abstract class TransOwnState extends Equatable {

  @override
  List<Object?> get props => [];

  TransOwnState();
}
class InitGetTransOwnState extends TransOwnState {}

class UpdateGetTransOwnState extends TransOwnState{
  DataTransOwn data;
  List<DataTableTransOwn> dataTable;

  UpdateGetTransOwnState(this.data,this.dataTable);
  @override
  List<Object> get props => [data, dataTable];
}

class LoadingTransOwnState extends TransOwnState {
}


class ErrorGetTransOwnState extends TransOwnState{
  final String msg;


  ErrorGetTransOwnState(this.msg);

  @override
  List<Object> get props => [msg];
}