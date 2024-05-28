import 'package:flutter/material.dart';

// Widget to display an internet connection exception message.
class InterNetExceptionWidget extends StatefulWidget {
  // Callback function to be invoked on button press.
  final VoidCallback onPress;

  // Constructor for InterNetExceptionWidget.
  const InterNetExceptionWidget({super.key, required this.onPress});

  @override
  State<InterNetExceptionWidget> createState() =>
      _InterNetExceptionWidgetState();
}

class _InterNetExceptionWidgetState extends State<InterNetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Icon indicating internet connection issue.
          SizedBox(height: MediaQuery.of(context).size.height * .15),
          const Icon(
            Icons.cloud_off,
            color: Colors.red,
            size: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: Text(
                // Error message indicating internet connection issue.
                'We’re unable to show results.\nPlease check your data\nconnection.',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .15),
          // Button to retry connection.
          ElevatedButton(
            onPressed: widget.onPress,
            child: Center(
              child: Text(
                'RETRY',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          )
        ],
      ),
    );
  }
}
