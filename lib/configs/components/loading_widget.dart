import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Widget to display a loading indicator.
class LoadingWidget extends StatelessWidget {
  // Size of the loading indicator.
  final double size;

  // Constructor for LoadingWidget.
  const LoadingWidget({super.key, this.size = 36.0});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: Platform.isIOS
            ? const CupertinoActivityIndicator(
                // iOS loading indicator color.
                color: Colors.blue,
              )
            : const CircularProgressIndicator(
                // Android loading indicator properties.
                strokeWidth: 2.0, color: Colors.blue,
              ),
      ),
    );
  }
}
