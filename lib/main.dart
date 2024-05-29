import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'main_import.dart';

// GetIt is a package used for service locator or to manage dependency injection
GetIt getIt = GetIt.instance;

void main() {
  // Initializing service locator for dependency injection
  servicesLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Providing blocs to the entire application
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => ToDoBloc()),
        BlocProvider(create: (_) => FavouriteBloc(FavouriteRepo())),
        BlocProvider(create: (_) => PostBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc Practice',
        themeMode: ThemeMode.system,
        // Light theme
        theme: lightTheme,
        // Dark theme
        darkTheme: darkTheme,
        // Initial route
        initialRoute: RoutesName.splash,
        // Generate routes
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

// Method for initializing service locator
void servicesLocator() {
  getIt.registerLazySingleton<AuthApiRepository>(() => AuthHttpApiRepository());
}
