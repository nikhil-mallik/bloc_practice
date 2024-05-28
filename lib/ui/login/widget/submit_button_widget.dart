import 'package:bloc_practice/utils/extensions/flush_bar_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login/login_screen_bloc.dart';
import '../../../configs/routes/routes_name.dart';
import '../../../utils/enums.dart';

/// Widget representing the submit button for the login form.
class SubmitButton extends StatelessWidget {
  /// GlobalKey for the form.
  final dynamic formKey;

  /// Constructor for SubmitButton widget, accepting a formKey parameter.
  const SubmitButton({super.key, required this.formKey});

  /// Build method to define the UI of the SubmitButton widget.
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenBloc, LoginScreenState>(
      // Listening for changes in login status.
      listenWhen: (current, previous) =>
          current.loginStatus != previous.loginStatus,
      listener: (context, state) {
        // Handling different login status scenarios.
        if (state.loginStatus == LoginStatus.error) {
          // Displaying error message if login fails.
          context.flushBarErrorMessage(message: state.message.toString());
        }

        if (state.loginStatus == LoginStatus.success) {
          // Navigating to home screen if login is successful.
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.home, (route) => false);
        }
      },
      child: BlocBuilder<LoginScreenBloc, LoginScreenState>(
        // Rebuilding the button only when login status changes.
        buildWhen: (current, previous) =>
            current.loginStatus != previous.loginStatus,
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              // Validating the form before initiating login API call.
              if (formKey.currentState.validate()) {
                context.read<LoginScreenBloc>().add(LoginApi());
              }
            }, // Displaying appropriate content based on login status.
            child: state.loginStatus == LoginStatus.loading
                ? const CircularProgressIndicator()
                : const Text('Login'),
          );
        },
      ),
    );
  }
}
