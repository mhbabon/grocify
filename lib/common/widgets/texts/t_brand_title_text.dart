import 'package:flutter/material.dart';
import 'package:grocify/utils/constants/enums.dart';

class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText({
    super.key,
    this.color,
    required this.title,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;





  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    late final TextStyle appliedStyle;

    if (brandTextSize == TextSizes.small) {
      appliedStyle = textTheme.labelMedium!.apply(color: color);
    } else if (brandTextSize == TextSizes.medium) {
      appliedStyle = textTheme.bodyLarge!.apply(color: color);
    } else {
      appliedStyle = textTheme.titleLarge!.apply(color: color);
    }

    return Text(
      title,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: appliedStyle
    );
  }
}
