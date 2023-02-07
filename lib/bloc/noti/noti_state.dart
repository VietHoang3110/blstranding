part of 'noti_bloc.dart';


abstract class NotiState extends Equatable {

  @override
  List<Object?> get props => [];

  NotiState();
}
class InitGetNotiState extends NotiState {}

class UpdateGetNotiState extends NotiState{
  DataNoti data;

  UpdateGetNotiState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingNotiState extends NotiState {
}


class ErrorGetNotiState extends NotiState{
  final String msg;


  ErrorGetNotiState(this.msg);

  @override
  List<Object> get props => [msg];
}