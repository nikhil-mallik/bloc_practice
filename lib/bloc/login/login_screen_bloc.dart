import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import '../../utils/enums.dart';

part 'login_screen_event.dart';part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc() : super(const LoginScreenState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginScreenState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(
      PasswordChanged event, Emitter<LoginScreenState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginApi(LoginApi event, Emitter<LoginScreenState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));

    Map data = {'email': state.email, 'password': state.password};

    try {
      final response =
          await http.post(Uri.parse('https://reqres.in/api/login'), body: data);
      var data1 = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(state.copyWith(
            loginStatus: LoginStatus.success, message: 'Login Successful'));
      } else {
        emit(state.copyWith(
            loginStatus: LoginStatus.error, message: data1['error']));
      }
    } catch (e) {
      emit(state.copyWith(
          loginStatus: LoginStatus.error, message: e.toString()));
    }
  }
}
