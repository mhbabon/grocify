import 'package:flutter/material.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.width,
    this.height,
    this.applyImageRadius = true,
    required this.imageurl,
    this.backgroundColor = TColors.light,
    this.fit = BoxFit.contain,
    this.isNetworkingImage = false,
    this.borderRadius = TSizes.md,
  });

  final double? width, height;
  final String imageurl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsets? padding;
  final bool isNetworkingImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor ,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: Image(
              fit: fit,
              image: isNetworkingImage
                  ? NetworkImage(imageurl)
                  : AssetImage(imageurl) as ImageProvider,
            )),
      ),
    );
  }
}
