part of 'money_bloc.dart';

abstract class MoneyEvent extends Equatable {

  @override
  List<Object?> get props => [];

  MoneyEvent();
}


class InitGetMoneyEvent extends MoneyEvent {
  int page;
  int numOfRecords;


  InitGetMoneyEvent(this.page, this.numOfRecords);



  @override
  List<Object?> get props => [];
}


