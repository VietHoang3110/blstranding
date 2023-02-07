part of 'trans_bloc.dart';

abstract class TransEvent extends Equatable {

  @override
  List<Object?> get props => [];

  TransEvent();
}


class InitGetTransEvent extends TransEvent {
  int page;
  int numOfRecords;


  InitGetTransEvent(this.page, this.numOfRecords);



  @override
  List<Object?> get props => [];
}


