part of 'change_pass_bloc.dart';


abstract class ChangePassState extends Equatable {

  @override
  List<Object?> get props => [];

  ChangePassState();
}
class InProgressChangePassState extends ChangePassState {}


class FailureChangePassState extends ChangePassState {
  final String message;
  FailureChangePassState({required this.message});
  @override
  List<Object?> get props => [message];
}


class SuccessChangePassState extends ChangePassState{
  final String message;
  SuccessChangePassState({required this.message});
  @override
  List<Object?> get props => [message];
}