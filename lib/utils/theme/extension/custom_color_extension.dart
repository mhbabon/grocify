import 'package:flutter/material.dart';

class CustomColorExtension extends ThemeExtension<CustomColorExtension> {
  final Color darkGreyColor;
  final Color tabBarColor;

  CustomColorExtension(
      {required this.tabBarColor, required this.darkGreyColor});

  @override
  CustomColorExtension copyWith({
    Color? darkGreyColor,
    Color? tabBarColor,
  }) {
    return CustomColorExtension(
      darkGreyColor: darkGreyColor ?? this.darkGreyColor,
      tabBarColor: tabBarColor ?? this.tabBarColor,
    );
  }

  @override
  CustomColorExtension lerp(
    ThemeExtension<CustomColorExtension>? other,
    double t,
  ) {
    if (other is! CustomColorExtension) return this;
    return CustomColorExtension(
      darkGreyColor: Color.lerp(darkGreyColor, other.darkGreyColor, t)!,
      tabBarColor: Color.lerp(tabBarColor, other.tabBarColor, t)!,
    );
  }
}
