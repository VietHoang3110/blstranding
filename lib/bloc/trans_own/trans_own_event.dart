part of 'trans_own_bloc.dart';

abstract class TransOwnEvent extends Equatable {

  @override
  List<Object?> get props => [];

  TransOwnEvent();
}


class InitGetTransOwnEvent extends TransOwnEvent {
  int page;
  int numOfRecords;

  InitGetTransOwnEvent(
      this.page,
      this.numOfRecords
      );

  @override
  List<Object?> get props => [];
}


