part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState(
      {this.email = const UserName.pure(),
      this.password = const Password.pure(),
      this.status = FormzStatus.pure,
      this.message = ''});

  final UserName email;
  final Password password;
  final FormzStatus status;
  final String message;

  LoginState copyWith({
    UserName? email,
    Password? password,
    String? message,
    FormzStatus? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [email, password, status, message];
}

class InitLoginState extends LoginState {}

class UpdateLoginState extends LoginState{

  final Login dataLogin;
  final String msg;

  const UpdateLoginState(this.dataLogin,this.msg);
  @override
  List<Object> get props => [dataLogin,msg];
}

class LoadingGetListIssueState extends LoginState {
}

class ErrorLoginState extends LoginState{
  final String msg;
  const ErrorLoginState(this.msg);
  @override
  List<Object> get props => [];
}