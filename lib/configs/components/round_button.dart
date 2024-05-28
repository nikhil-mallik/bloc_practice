import 'package:flutter/material.dart';

import '../color/color.dart';

// Widget for a round button.
class RoundButton extends StatelessWidget {
  // Title of the button.
  final String title;

  // Flag to indicate if loading indicator should be shown.
  final bool loading;

  // Callback function when the button is pressed.
  final VoidCallback onPress;

  // Constructor for RoundButton.
  const RoundButton({
    super.key,
    required this.title,
    this.loading = false,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          // Button background color.
          color: AppColors.buttonColor,
          // Button border radius for rounded corners.
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  // Loading indicator color.
                  color: Colors.white,
                )
              : Text(
                  // Button text.
                  title, style: const TextStyle(color: AppColors.whiteColor),
                ),
        ),
      ),
    );
  }
}
