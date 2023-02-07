part of 'get_profile_bloc.dart';


abstract class ProfileCumState extends Equatable {

  @override
  List<Object?> get props => [];

  ProfileCumState();
}
class InitGetProfileCumState extends ProfileCumState {}

class UpdateGetProfileCumState extends ProfileCumState{
  DataProfile data;

  UpdateGetProfileCumState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingProfileCumState extends ProfileCumState {
}


class ErrorGetProfileCumState extends ProfileCumState{
  final String msg;


  ErrorGetProfileCumState(this.msg);

  @override
  List<Object> get props => [msg];
}