import 'package:flutter/material.dart';
import 'package:grocify/utils/extension/util_extension.dart';


class TFromDivider extends StatelessWidget {
  const TFromDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
          color: context.myColor?.darkGreyColor,
          thickness: 0.5,
          indent: 60,
          endIndent: 5,
        )),

        Text(dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
            child: Divider(
          color: context.myColor?.darkGreyColor,
          thickness: 0.5,
          indent: 5,
          endIndent: 60,
        )),
      ],
    );
  }
}
