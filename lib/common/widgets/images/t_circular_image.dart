import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grocify/common/widgets/effect/shimmer.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 70,
    this.height = 70,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.padding = TSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            color: _getBackgroundColor(context),
            borderRadius: BorderRadius.circular(100)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Center(
            child: _getImageWidget(),
          ),
        ));
  }

  // Function to get background color dynamically
  Color _getBackgroundColor(BuildContext context) {
    if (backgroundColor != null) {
      return backgroundColor!;
    }
    return THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white;
  }




  // Function to handle image loading dynamically
  Widget _getImageWidget() {
    if (isNetworkImage) {
      if (image.isNotEmpty) {
        return CachedNetworkImage(
          fit: fit,
          color: overlayColor,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
          const TShimmerEffect(width: 55, height: 55),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );
      } else {
        return const Center(child: Icon(Icons.broken_image)); // Placeholder for empty URL
      }
    } else {
      return Image(
        fit: fit,
        image: AssetImage(image),
        color: overlayColor,
      );
    }
  }



}
