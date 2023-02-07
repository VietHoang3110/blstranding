part of 'contact_bloc.dart';


abstract class ContactState extends Equatable {

  @override
  List<Object?> get props => [];

  ContactState();
}
class InitGetContactState extends ContactState {}

class UpdateGetContactState extends ContactState{
  List<DataContact> data;

  UpdateGetContactState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingContactState extends ContactState {
}


class ErrorGetContactState extends ContactState{
  final String msg;


  ErrorGetContactState(this.msg);

  @override
  List<Object> get props => [msg];
}