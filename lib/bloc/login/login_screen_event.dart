part of 'login_screen_bloc.dart';

// Abstract class LoginScreenEvent that extends Equatable to ensure value equality.
abstract class LoginScreenEvent extends Equatable {
  // Constructor for LoginScreenEvent.
  const LoginScreenEvent();

  // Overriding props method to return an empty list for value comparison.
  @override
  List<Object?> get props => [];
}

// Event class for email change.
class EmailChanged extends LoginScreenEvent {
  // Constructor for EmailChanged event, accepting an email parameter.
  const EmailChanged({required this.email});

  // Email value.
  final String email;

  // Overriding props method to include email for value comparison.
  @override
  List<Object?> get props => [email];
}

// Event class for password change.
class PasswordChanged extends LoginScreenEvent {
  // Constructor for PasswordChanged event, accepting a password parameter.
  const PasswordChanged({required this.password});

  // Password value.
  final String password;

  // Overriding props method to include password for value comparison.
  @override
  List<Object?> get props => [password];
}

// Event class for login API call.
class LoginApi extends LoginScreenEvent {}
