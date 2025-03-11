import 'package:flutter/material.dart';
import 'package:grocify/utils/theme/extension/custom_color_extension.dart';

extension ThemeExt on BuildContext {
  ThemeData get themeData => Theme.of(this);

  CustomColorExtension? get myColor => Theme.of(this).extension<CustomColorExtension>();

  TextTheme get textTheme => Theme.of(this).textTheme;
}
