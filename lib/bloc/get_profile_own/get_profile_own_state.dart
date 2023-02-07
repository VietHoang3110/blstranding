part of 'get_profile_own_bloc.dart';


abstract class ProfileOwnState extends Equatable {

  @override
  List<Object?> get props => [];

  ProfileOwnState();
}
class InitGetProfileOwnState extends ProfileOwnState {}

class UpdateGetProfileOwnState extends ProfileOwnState{
  DataProfile data;

  UpdateGetProfileOwnState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingProfileOwnState extends ProfileOwnState {
}


class ErrorGetProfileOwnState extends ProfileOwnState{
  final String msg;


  ErrorGetProfileOwnState(this.msg);

  @override
  List<Object> get props => [msg];
}