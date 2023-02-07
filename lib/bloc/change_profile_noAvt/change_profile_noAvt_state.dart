part of 'change_profile_noAvt_bloc.dart';


abstract class ChangeProfileNoAvtState extends Equatable {

  @override
  List<Object?> get props => [];

  ChangeProfileNoAvtState();
}
class InProgressChangeProfileNoAvtState extends ChangeProfileNoAvtState {}


class FailureChangeProfileNoAvtState extends ChangeProfileNoAvtState {
  final String message;
  FailureChangeProfileNoAvtState({required this.message});
  @override
  List<Object?> get props => [message];
}


class SuccessChangeProfileNoAvtState extends ChangeProfileNoAvtState{
  final String message;
  SuccessChangeProfileNoAvtState({required this.message});
  @override
  List<Object?> get props => [message];
}