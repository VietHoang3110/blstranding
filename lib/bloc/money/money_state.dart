part of 'money_bloc.dart';


abstract class MoneyState extends Equatable {

  @override
  List<Object?> get props => [];

  MoneyState();
}
class InitGetMoneyState extends MoneyState {}

class UpdateGetMoneyState extends MoneyState{
  DataMoney? data;

  UpdateGetMoneyState(this.data);
  @override
  List<Object> get props => [data!];
}

class LoadingMoneyState extends MoneyState {
}


class ErrorGetMoneyState extends MoneyState{
  final String msg;


  ErrorGetMoneyState(this.msg);

  @override
  List<Object> get props => [msg];
}