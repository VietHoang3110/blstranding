part of 'home_bloc.dart';


abstract class HomeState extends Equatable {

  @override
  List<Object?> get props => [];

  HomeState();
}
class InitGetHomeState extends HomeState {}

class UpdateGetHomeState extends HomeState{
  HomeData data;

  UpdateGetHomeState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingHomeState extends HomeState {
}


class ErrorGetHomeState extends HomeState{
  final String msg;


  ErrorGetHomeState(this.msg);

  @override
  List<Object> get props => [msg];
}