part of 'change_pass_bloc.dart';

abstract class ChangePassEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ChangePassEvent();
}



class ChangePassSubmitted extends ChangePassEvent {
  ChangePassSubmitted(this.oldPassword, this.newPassword, this.confirmPassword);

  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  @override
  List<Object> get props => [oldPassword, newPassword, confirmPassword];
}
