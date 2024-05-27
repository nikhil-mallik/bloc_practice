part of 'login_screen_bloc.dart';

abstract class LoginScreenEvent extends Equatable {
  const LoginScreenEvent();

  @override
  List<Object?> get props => [];
}

class EmailChanged extends LoginScreenEvent {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends LoginScreenEvent {

  const PasswordChanged({required this.password});
  final String password;

  @override
  // TODO: implement props
  List<Object?> get props => [password];
}

class LoginApi extends LoginScreenEvent {}