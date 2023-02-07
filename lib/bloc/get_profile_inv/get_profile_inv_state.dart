part of 'get_profile_inv_bloc.dart';


abstract class ProfileInvState extends Equatable {

  @override
  List<Object?> get props => [];

  ProfileInvState();
}
class InitGetProfileInvState extends ProfileInvState {}

class UpdateGetProfileInvState extends ProfileInvState{
  DataProfile data;

  UpdateGetProfileInvState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingProfileInvState extends ProfileInvState {
}


class ErrorGetProfileInvState extends ProfileInvState{
  final String msg;


  ErrorGetProfileInvState(this.msg);

  @override
  List<Object> get props => [msg];
}