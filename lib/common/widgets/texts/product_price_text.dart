import 'package:flutter/material.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    super.key,
    this.currencySign = "BDT  ",
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
  });

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final TextStyle baseStyle = isLarge
        ? textTheme.headlineMedium!
        : textTheme.titleLarge!;
    final TextStyle finalStyle = baseStyle.apply(
      decoration: lineThrough ? TextDecoration.lineThrough : null,
    );

    return Text(
      currencySign + price ,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: finalStyle,
    );
  }
}
