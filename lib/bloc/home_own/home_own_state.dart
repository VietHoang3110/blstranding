part of 'home_own_bloc.dart';


abstract class HomeOwnState extends Equatable {

  @override
  List<Object?> get props => [];

  HomeOwnState();
}
class InitGetHomeOwnState extends HomeOwnState {}

class UpdateGetHomeOwnState extends HomeOwnState{
  HomeOwnData data;

  UpdateGetHomeOwnState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingHomeOwnState extends HomeOwnState {
}


class ErrorGetHomeOwnState extends HomeOwnState{
  final String msg;


  ErrorGetHomeOwnState(this.msg);

  @override
  List<Object> get props => [msg];
}