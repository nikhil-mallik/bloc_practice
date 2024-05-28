import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/auth_api/auth_api_repository.dart';
import '../../services/session_manager/session_controller.dart';
import '../../utils/enums.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

// LoginScreenBloc class which extends Bloc to handle LoginScreenEvent and LoginScreenState.
class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  // Repository for authentication API.
  AuthApiRepository authApiRepository;

  // Constructor for LoginScreenBloc, initializing with the authentication API repository.
  LoginScreenBloc({required this.authApiRepository}) : super(const LoginScreenState()) {
    // Registering the event handlers.
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
  }

  // Handler for handling email change event.
  void _onEmailChanged(EmailChanged event, Emitter<LoginScreenState> emit) {
    // Emitting a new state with updated email.
    emit(state.copyWith(email: event.email));
  }

  // Handler for handling password change event.
  void _onPasswordChanged(PasswordChanged event, Emitter<LoginScreenState> emit) {
    // Emitting a new state with updated password.
    emit(state.copyWith(password: event.password));
  }

  // Handler for handling login API call event.
  void _loginApi(LoginApi event, Emitter<LoginScreenState> emit) async {
    // Creating a map with email and password.
    Map<String, String> data = {
      'email': state.email,
      'password': state.password,
    };

    // Emitting a new state with login status set to loading.
    emit(state.copyWith(loginStatus: LoginStatus.loading));

    // Calling the login API and handling response.
    await authApiRepository.loginApi(data).then((value) async {
      if (value.error.isNotEmpty) {
        // If there's an error, emitting a new state with error message and login status set to error.
        emit(state.copyWith(
            loginStatus: LoginStatus.error, message: value.error));
      } else {
        // If login is successful, saving user data to preference and emitting a new state with login status set to success.
        await SessionController().saveUserInPreference(value);
        await SessionController().getUserFromPreference();
        emit(state.copyWith(loginStatus: LoginStatus.success));
      }
    }).onError((error, stackTrace) {
      // If there's an error during API call, emitting a new state with error message and login status set to error.
      emit(state.copyWith(
          loginStatus: LoginStatus.error, message: error.toString()));
    });
  }
}

