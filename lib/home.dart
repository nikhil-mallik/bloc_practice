import 'package:flutter/material.dart';

import 'configs/routes/routes_name.dart'; // Importing routes names for navigation
import 'services/storage/local_storage.dart'; // Importing local storage for managing user data

/// Widget for the home screen.
class Home extends StatelessWidget {
  const Home({super.key});

  /// Method to display practice list items.
  Widget showPracticeList(BuildContext context, String name, String className) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, className),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Practice'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Logging out the user
              LocalStorage localStorage = LocalStorage();
              localStorage.clearValue('token').then((value) {
                localStorage.clearValue('isLogin').then((value) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RoutesName.login, (route) => false);
                });
              });
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Showing practice list items
            showPracticeList(
                context, 'Counter Example', RoutesName.counterScreen),
            showPracticeList(
                context, 'Switch Example', RoutesName.switchScreen),
            showPracticeList(
                context, 'Image Picker Example', RoutesName.imagePickerScreen),
            showPracticeList(context, 'TO DO Example', RoutesName.todoScreen),
            showPracticeList(
                context, 'Favourite Example', RoutesName.favouriteScreen),
            showPracticeList(context, 'Get API Example', RoutesName.postScreen),
          ],
        ),
      ),
    );
  }
}
