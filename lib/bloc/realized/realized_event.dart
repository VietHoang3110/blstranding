part of 'realized_bloc.dart';

abstract class RealizedEvent extends Equatable {

  @override
  List<Object?> get props => [];

  RealizedEvent();
}


class InitGetRealizedEvent extends RealizedEvent {
  int page;
  int numOfRecords;


  InitGetRealizedEvent(this.page, this.numOfRecords);

  @override
  List<Object?> get props => [];
}


