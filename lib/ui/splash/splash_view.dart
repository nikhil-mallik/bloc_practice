import 'package:flutter/material.dart';

import '../../services/splash/splash_services.dart';

/// A widget representing the splash screen of the application.
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screen',
            style: Theme.of(context).textTheme.displayMedium),
      ),
    );
  }
}
