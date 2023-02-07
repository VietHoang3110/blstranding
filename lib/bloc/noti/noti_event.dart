part of 'noti_bloc.dart';

abstract class NotiEvent extends Equatable {

  @override
  List<Object?> get props => [];

  NotiEvent();
}


class InitGetNotiEvent extends NotiEvent {
  int page;
  int numOfRecords;


  InitGetNotiEvent(this.page, this.numOfRecords);

  @override
  List<Object?> get props => [];
}


