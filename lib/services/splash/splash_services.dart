import 'dart:async'; // Importing dart:async for asynchronous operations

import 'package:flutter/material.dart'; // Importing Flutter material library

import '../../../configs/routes/routes_name.dart'; // Importing routes names for navigation
import '../session_manager/session_controller.dart';

/// A class containing services related to the splash screen.
class SplashServices {
  /// Checks authentication status and navigates accordingly.
  void checkAuthentication(BuildContext context) async {
    SessionController().getUserFromPreference().then((value) async {
      if (SessionController.isLogin ?? false) {
        Timer(
          const Duration(seconds: 1),
              () => Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.home, (route) => false),
        );
      } else {
        Timer(
          const Duration(seconds: 1),
              () => Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.login, (route) => false),
        );
      }
    }).onError((error, stackTrace) {
      Timer(
        const Duration(seconds: 1),
            () => Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.login, (route) => false),
      );
    });
  }
}
