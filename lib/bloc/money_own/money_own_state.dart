part of 'money_own_bloc.dart';


abstract class MoneyOwnState extends Equatable {

  @override
  List<Object?> get props => [];

  MoneyOwnState();
}
class InitGetMoneyOwnState extends MoneyOwnState {}

class UpdateGetMoneyOwnState extends MoneyOwnState{
  DataMoneyOwn? data;
  List<DataTableMoneyOwn> datatable;

  UpdateGetMoneyOwnState(this.data, this.datatable);
  @override
  List<Object> get props => [data!, datatable];
}

class LoadingMoneyOwnState extends MoneyOwnState {
}


class ErrorGetMoneyOwnState extends MoneyOwnState{
  final String msg;


  ErrorGetMoneyOwnState(this.msg);

  @override
  List<Object> get props => [msg];
}