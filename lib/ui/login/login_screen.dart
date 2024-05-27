import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/login/login_screen_bloc.dart';
import '../../utils/enums.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginScreenBloc _loginBlocs;

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginBlocs = LoginScreenBloc();
  }

  @override
  void dispose() {
    _loginBlocs.close();
    print('closing blocs');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: BlocProvider(
        create: (_) => _loginBlocs,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: BlocListener<LoginScreenBloc, LoginScreenState>(
              listenWhen: (previous, current) =>
                  previous.loginStatus != current.loginStatus,
              listener: (context, state) {
                if (state.loginStatus == LoginStatus.error) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                        SnackBar(content: Text(state.message.toString())));
                }
                if (state.loginStatus == LoginStatus.success) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                        const SnackBar(content: Text('Login Successful')));
                }
              },
              child: Center(
                child: Column(
                  children: [
                    BlocBuilder<LoginScreenBloc, LoginScreenState>(
                      buildWhen: (current, previous) =>
                          current.email != previous.email,
                      builder: (context, state) {
                        return TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(),
                          ),
                          focusNode: emailFocusNode,
                          onChanged: (val) {
                            context
                                .read<LoginScreenBloc>()
                                .add(EmailChanged(email: val));
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Enter Email';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20
                    ),
                    BlocBuilder<LoginScreenBloc, LoginScreenState>(
                      buildWhen: (current, previous) =>
                          current.password != previous.password,
                      builder: (context, state) {
                        return TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(),
                          ),
                          focusNode: passwordFocusNode,
                          onChanged: (value) {
                            context
                                .read<LoginScreenBloc>()
                                .add(PasswordChanged(password: value));
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Enter Password';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 50
                    ),
                    BlocBuilder<LoginScreenBloc, LoginScreenState>(
                      buildWhen: (current, previous) =>
                          current.loginStatus != previous.loginStatus,
                      builder: (context, state) {
                        return ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginScreenBloc>().add(LoginApi());
                              }
                            },
                            child: state.loginStatus == LoginStatus.loading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : const Text('Login'),);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
