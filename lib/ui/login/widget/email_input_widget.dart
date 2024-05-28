import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login/login_screen_bloc.dart';

/// Widget representing the email input field.
class EmailInput extends StatelessWidget {
  /// Constructor for EmailInput widget, accepting a focusNode parameter.
  const EmailInput({super.key, required this.focusNode});

  /// FocusNode for the email input field.
  final FocusNode focusNode;

  /// Build method to define the UI of the EmailInput widget.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginScreenBloc, LoginScreenState>(
      builder: (context, state) {
        return TextFormField(
          focusNode: focusNode,
          // Setting focus node
          decoration: const InputDecoration(
              icon: Icon(Icons.email), // Icon for email input field
              labelText: 'Email',
              helperText: 'eve.holt@reqres.in',
              hintText: 'Enter your email'),
          keyboardType: TextInputType.emailAddress,
          // Setting keyboard type to email address
          onChanged: (value) {
            // Dispatching EmailChanged event when email input changes
            context.read<LoginScreenBloc>().add(EmailChanged(email: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter email';
            }

            // if (value.emailValidator()) {
            //   return 'Email is not correct';
            // }
            return null;
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
