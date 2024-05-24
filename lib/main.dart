import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter/counter_bloc.dart';
import 'bloc/favourite_example/favourite_bloc.dart';
import 'bloc/image_picker/image_picker_bloc.dart';
import 'bloc/posts/post_bloc.dart';
import 'bloc/switch_example/switch_bloc.dart';
import 'bloc/to_do_example/to_do_bloc.dart';
import 'home.dart';
import 'repository/favourite_repo.dart';
import 'utils/image_picker_utlis.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtlis())),
        BlocProvider(create: (_) => ToDoBloc()),
        BlocProvider(create: (_) => FavouriteBloc(FavouriteRepo())),
        BlocProvider(create: (_) => PostBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc Practice',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}
