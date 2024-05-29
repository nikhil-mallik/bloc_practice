import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/login/login_screen_bloc.dart';
import '../../main.dart';
import 'widget/widgets.dart';

// LoginScreen class which is a StatefulWidget representing the login screen.
class LoginScreen extends StatefulWidget {
  // Constructor for LoginScreen, accepting a key.
  const LoginScreen({super.key});

  // Override createState method to create state for LoginScreen.
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// _LoginScreenState class representing the state for LoginScreen.
class _LoginScreenState extends State<LoginScreen> {
  // LoginScreenBloc instance to handle login screen logic.
  late LoginScreenBloc _loginBloc;

  // FocusNode for email input field.
  final _emailFocusNode = FocusNode();

  // FocusNode for password input field.
  final _passwordFocusNode = FocusNode();

  // GlobalKey for the form.
  final _formKey = GlobalKey<FormState>();

  // initState method to initialize state.
  @override
  void initState() {
    super.initState();
    // Initialize LoginScreenBloc with authentication API repository.
    _loginBloc = LoginScreenBloc(authApiRepository: getIt());
  }

  // dispose method to dispose resources.
  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _loginBloc.close();
    super.dispose();
  }

  // build method to define the UI of the LoginScreen.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold with body containing login form.
      body: SafeArea(
        child: BlocProvider(
          // Providing LoginScreenBloc to its descendants.
          create: (_) => _loginBloc,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Widget for email input field.
                  EmailInput(focusNode: _emailFocusNode),
                  // Widget for password input field.
                  PasswordInput(focusNode: _passwordFocusNode),
                  // Widget for submit button.
                  SubmitButton(formKey: _formKey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
