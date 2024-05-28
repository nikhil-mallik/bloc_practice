import 'package:bloc_practice/services/storage/local_storage.dart'; // Importing local storage service
import 'package:flutter/material.dart'; // Importing Flutter material library

import '../../configs/routes/routes_name.dart'; // Importing route names for navigation

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key}); // Constructor for DashboardScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Screen'), // AppBar title
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Padding for content
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Dashboard Screen After Login'), // Text widget
                const SizedBox(height: 50), // Vertical space
                ElevatedButton(
                  onPressed: () {
                    LocalStorage localStorage =
                        LocalStorage(); // LocalStorage instance
                    // Clearing token from local storage
                    localStorage.clearValue('token').then((value) {
                      // Clearing login status from local storage
                      localStorage.clearValue('isLogin').then((value) {
                        // Navigating to login screen
                        Navigator.pushNamedAndRemoveUntil(
                            context, RoutesName.login, (route) => false);
                      });
                    });
                  },
                  child: const Text('Logout'), // Button text
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
