part of 'change_profile_bloc.dart';


abstract class ChangeProfileState extends Equatable {

  @override
  List<Object?> get props => [];

  ChangeProfileState();
}
class InProgressChangeProfileState extends ChangeProfileState {}


class FailureChangeProfileState extends ChangeProfileState {
  final String message;
  FailureChangeProfileState({required this.message});
  @override
  List<Object?> get props => [message];
}


class SuccessChangeProfileState extends ChangeProfileState{
  final String message;
  final String avatar;
  SuccessChangeProfileState({required this.message, required this.avatar});
  @override
  List<Object?> get props => [message, avatar];
}