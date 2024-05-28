import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login/login_screen_bloc.dart';

/// Widget representing the password input field.
class PasswordInput extends StatelessWidget {
  /// Constructor for PasswordInput widget, accepting a focusNode parameter.
  const PasswordInput({super.key, required this.focusNode});

  /// FocusNode for the password input field.
  final FocusNode focusNode;

  /// Build method to define the UI of the PasswordInput widget.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginScreenBloc, LoginScreenState>(
      builder: (context, state) {
        return TextFormField(
          focusNode: focusNode,
          // Setting focus node
          decoration: const InputDecoration(
            icon: Icon(Icons.lock),
            // Icon for password input field
            helperText: '123456',
            helperMaxLines: 2,
            labelText: 'Password',
            hintText: 'Enter your password',
            errorMaxLines: 2,
          ),
          obscureText: true,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter password';
            }
            if (value.length < 6) {
              return 'please enter password greater than 6 char';
            }
            return null;
          },
          onChanged: (value) {
            // Dispatching PasswordChanged event when password input changes
            context
                .read<LoginScreenBloc>()
                .add(PasswordChanged(password: value));
          },
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}
