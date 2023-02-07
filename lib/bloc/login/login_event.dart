part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

// class FormSubmitted extends LoginEvent {
//   final String username, password;
//   final String? type;
//   const FormSubmitted(this.username, this.password, this.type);
// }



class FormSubmitted extends LoginEvent {
  FormSubmitted(this.username, this.password, this.type);

  final String username;
  final String password;
  final String type;

  @override
  List<Object> get props => [username, password, type];
}