part of 'home_inv_bloc.dart';


abstract class HomeInvState extends Equatable {

  @override
  List<Object?> get props => [];

  HomeInvState();
}
class InitGetHomeInvState extends HomeInvState {}

class UpdateGetHomeInvState extends HomeInvState{
  HomeInvData data;

  UpdateGetHomeInvState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingHomeInvState extends HomeInvState {
}


class ErrorGetHomeInvState extends HomeInvState{
  final String msg;


  ErrorGetHomeInvState(this.msg);

  @override
  List<Object> get props => [msg];
}