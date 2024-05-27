part of 'login_screen_bloc.dart';

class LoginScreenState extends Equatable {
  const LoginScreenState({
    this.email = '',
    this.password = '',
    this.message = '',
    this.loginStatus = LoginStatus.initial,
  });

  final String email;
  final String password;
  final String message;
  final LoginStatus loginStatus;

  LoginScreenState copyWith({
    String? email,
    String? password,
    String? message,
    LoginStatus? loginStatus,
  }) {
    return LoginScreenState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }

  @override
  List<Object?> get props => [email, password, message, loginStatus];
}
