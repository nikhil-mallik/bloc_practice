part of 'login_screen_bloc.dart';

/// LoginScreenState class that extends Equatable to ensure value equality.
class LoginScreenState extends Equatable {
  /// Default constructor for LoginScreenState with optional parameters.
  const LoginScreenState({
    this.email = '',
    this.password = '',
    this.message = '',
    this.loginStatus = LoginStatus.initial,
  });

  // Email field.
  final String email;

  // Password field.
  final String password;

  // Message field for displaying error or success messages.
  final String message;

  // Login status field to indicate the current state of login process.
  final LoginStatus loginStatus;

  /// Method to create a copy of the current state with updated fields.
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

  /// Overriding props method to include all fields for value comparison.
  @override
  List<Object?> get props => [email, password, message, loginStatus];
}
