part of 'money_own_bloc.dart';

abstract class MoneyOwnEvent extends Equatable {

  @override
  List<Object?> get props => [];

  MoneyOwnEvent();
}


class InitGetMoneyOwnEvent extends MoneyOwnEvent {
  int page;
  int numOfRecords;


  InitGetMoneyOwnEvent(this.page, this.numOfRecords);

  @override
  List<Object?> get props => [];
}


