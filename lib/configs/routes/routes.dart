import 'package:flutter/material.dart';

import '../../ui/views.dart'; // Importing views from UI package.
import 'routes_name.dart'; // Importing route names.

// Class to generate routes dynamically.
class Routes {
  // Method to generate routes based on route settings.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Switch case to handle different route names.
    switch (settings.name) {
      // Splash screen route.
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());

      // Login screen route.
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

      // Home screen route.
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Home());

      // Dashboard screen route.
      case RoutesName.dashboard:
        return MaterialPageRoute(
            builder: (BuildContext context) => const DashboardScreen());

      // Counter screen route.
      case RoutesName.counterScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CounterScreen());

      // Post screen route.
      case RoutesName.postScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const PostScreen());

      // Favourite screen route.
      case RoutesName.favouriteScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const FavouriteScreen());

      // Image picker screen route.
      case RoutesName.imagePickerScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ImagePickerScreen());

      // Todo screen route.
      case RoutesName.todoScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ToDoScreen());

      // Switch example screen route.
      case RoutesName.switchScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SwitchExampleScreen());

      // Default case for routes not defined.
      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text('No route defined'),
              ),
            );
          },
        );
    }
  }
}
