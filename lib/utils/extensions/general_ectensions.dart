import 'package:flutter/material.dart';

/// Extension method for accessing media query values from BuildContext.
extension MediaQueryValues on BuildContext {
  /// Returns the height of the current media query.
  double get mediaQueryHeight => MediaQuery.sizeOf(this).height;

  /// Returns the width of the current media query.
  double get mediaQueryWidth => MediaQuery.sizeOf(this).width;
}

/// Extension method for creating empty space widgets with specified height or width.
extension EmptySpace on num {
  /// Returns a SizedBox with specified height.
  SizedBox get height => SizedBox(height: toDouble());

  /// Returns a SizedBox with specified width.
  SizedBox get width => SizedBox(width: toDouble());
}
