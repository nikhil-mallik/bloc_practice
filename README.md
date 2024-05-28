# Flutter Bloc Practice

This is a Flutter project aimed at practicing Bloc architecture and various related concepts. It includes different examples and features implemented using the Bloc pattern.

## Project Description

The Bloc Practice App is a Flutter-based application designed to help developers understand and implement the Bloc (Business Logic Component) pattern in their Flutter projects. This app provides a series of practical examples and exercises that demonstrate how to manage state effectively using the Bloc pattern.

The Bloc pattern is a predictable state management solution for Dart and Flutter applications. It helps to separate presentation and business logic, making the app more modular, testable, and maintainable. This project covers a range of use cases and scenarios, including counter management, switch toggling, image picking, todo list management, and more.

### Key Features:

- **Counter Example** : Demonstrates simple state management by implementing a counter that can be incremented or decremented.
- **Switch Example** : Shows how to manage the state of a toggle switch.
- **Image Picker Example** : Integrates with the device's camera and gallery to pick images.
- **ToDo Example** : Provides functionality to add, delete, and manage a list of todo items.
- **Favourite Example** : Allows marking items as favourite and deleting them.
- **API Integration** : Fetches and displays data from an external API, demonstrating how to handle HTTP requests and parse JSON data.
- **Authentication** : Implements user login functionality with an HTTP API.
- **State Management** : Utilizes the Bloc pattern for managing states across different features and screens.

## Table of Contents

1. [Introduction](#introduction)
2. [Project Setup](#project-setup)
3. [Folder Structure](#folder-structure)
4. [Features](#features)
   - [Counter Example](#counter-example)
   - [Switch Example](#switch-example)
   - [Image Picker Example](#image-picker-example)
   - [ToDo Example](#todo-example)
   - [Favourite Example](#favourite-example)
   - [API Integration](#api-integration)
   - [Authentication](#authentication)
5. [Dependencies](#dependencies)
6. [Usage](#usage)
7. [Contributing](#contributing)
8. [License](#license)
9. [Appendix](#appendix)
   - [Additional Resources](#additional-resources)
   - [Roadmap](#roadmap)
10. [Support](#support)
11. [Contributors](#contributors)

## Introduction

The Bloc Practice App is designed to provide hands-on experience with the Bloc state management pattern in Flutter. The examples included in this project demonstrate how to effectively separate business logic from UI code, ensuring a clean and maintainable codebase.

## Project Setup

To run the project locally, follow these steps :
1. Clone the repository to your local machine.
2. Open the project in your preferred Flutter development environment.
3. Install dependencies :

    ```sh
    flutter pub get
    ```

4. Run the app :

    ```sh
    flutter run
    ```

## Folder Structure

The project follows a modular folder structure, making it easy to locate and manage different parts of the app. Here's an overview of the main folders:

- `bloc/` : Contains all the Bloc classes for state management.
- `configs/` : Configuration files for routes and themes.
- `model/` : Data models used in the application.
- `repository/` : Contains classes for data fetching and manipulation.
- `services/` : Utility classes for various services like local storage and session management.
- `utils/` : Utility classes and functions.
- `view/` : UI components and screens.

## Features

### Counter Example
A simple counter app demonstrating how to use Bloc for state management.

### Switch Example
Shows how to manage the state of a toggle switch using Bloc.

### Image Picker Example
Allows users to pick images from their device's camera or gallery.

### ToDo Example
Provides functionality to add, delete, and manage a list of to-do items.

### Favourite Example
Allows marking items as favourite and deleting them.

### API Integration
Fetches and displays data from an external API, demonstrating how to handle HTTP requests and parse JSON data.

### Authentication
Implements user login functionality with an HTTP API.

- **Auth API Repository** : Provides methods for authentication API requests.
- **Auth HTTP API Repository** : Implements HTTP requests to the authentication API for login functionality.
- **Mock Auth API Repository** : A mock implementation for simulating login requests.

## Dependencies

The project utilizes the following major dependencies:

- [Bloc](https://pub.dev/packages/bloc) : For implementing the Bloc architecture.
- [Flutter Bloc](https://pub.dev/packages/flutter_bloc) : For integrating the Bloc code to flutter UI.
- [Equatable](https://pub.dev/packages/equatable) : For simplifying equality comparisons for objects.
- [Image Picker](https://pub.dev/packages/image_picker) : For integrating image picking functionality.
- [HTTP](https://pub.dev/packages/http) : For making HTTP requests.
- [Get It](https://pub.dev/packages/get_it) : For service location and dependency injection.
- [Freezed Annotation](https://pub.dev/packages/freezed_annotation) : For generating code for immutable classes and unions.
- [JSON Annotation](https://pub.dev/packages/json_annotation) : For generating code for JSON serialization and deserialization.
- [Flutter Toast](https://pub.dev/packages/fluttertoast) : For displaying toast notifications.
- [Another Flushbar](https://pub.dev/packages/another_flushbar) : For displaying custom flushbar notifications.
- [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage) : For secure storage of sensitive information.
- [Google Fonts](https://pub.dev/packages/google_fonts) : For using custom fonts in the application.
- [Flutter Lints](https://pub.dev/packages/flutter_lints) : For linting Flutter code.
- [Build Runner](https://pub.dev/packages/build_runner) : For running code generation tasks.
- [Freezed](https://pub.dev/packages/freezed) : For code generation of immutable classes and unions.
- [JSON Serializable](https://pub.dev/packages/json_serializable) : For generating code for JSON serialization and deserialization.

## Usage

To use the Bloc Practice App, navigate through the examples provided in the app and explore the implementation details in the code. Each example demonstrates a specific use case of the Bloc pattern.

## Contributing

Contributions are welcome! If you have any ideas or improvements, feel free to open a pull request or create an issue.

## License

This project is licensed under the MIT License.

## Appendix

### Additional Resources

- [Bloc Library Documentation](https://bloclibrary.dev/)
- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)
- [Effective Dart Guide](https://dart.dev/guides/language/effective-dart)
- [Bloc Pattern Tutorial](https://bloclibrary.dev/#/flutterweathertutorial)
- [Flutter Bloc Package](https://pub.dev/packages/flutter_bloc)

### Roadmap

Here are some planned enhancements for future versions:

- Implement user registration functionality.
- Add support for persistent user sessions using local storage.
- Enhance UI with animations and transitions.
- Improve error handling and network request retries.
- Expand test coverage with unit and widget tests.

## Support

For support, email nikhil.mallik@thegatewaycorp.co.in or connect on LinkedIn at [Nikhil Mallik](https://www.linkedin.com/in/nikhil-mallik-24265a193).

## Contributors

[Nikhil Mallik](https://www.linkedin.com/in/nikhil-mallik-24265a193)

Feel free to contribute to the project by submitting pull requests or opening issues for any improvements or bug fixes.


