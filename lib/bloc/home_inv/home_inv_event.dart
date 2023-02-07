part of 'home_inv_bloc.dart';


abstract class HomeInvEvent extends Equatable {

  @override
  List<Object?> get props => [];

  HomeInvEvent();
}


class InitGetHomeInvEvent extends HomeInvEvent {
  int page;
  int numOfRecords;



  InitGetHomeInvEvent(
      this.page,
      this.numOfRecords
      );

  @override
  List<Object?> get props => [];
}


