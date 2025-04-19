import 'package:flutter/material.dart';
import 'package:grocify/common/widgets/appbar/appbar.dart';
import 'package:grocify/common/widgets/products/ratings/rating_indicator.dart';
import 'package:grocify/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:grocify/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:grocify/utils/constants/sizes.dart';



class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      /// --- app bar
      appBar: const TAppBar(title: Text('Reviews & Ratings'),showBackArrow: true,),

      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const Text('Ratings nd reviews are verified and re from people who use the same type of device tht you use.'),
                const SizedBox(height: TSizes.spaceBtwItems,),

                /// --- Overall Product Ratings
                const TOverallProductRating(),
                const TRatingBarIndicator(rating: 3.5,),
                Text('12,611',style: Theme.of(context).textTheme.bodySmall,),
                const SizedBox(height: TSizes.spaceBtwSections,),


                const UserReviewCard(),
                const UserReviewCard(),
                const UserReviewCard(),

            ],
          ),
        ),
      ),
    );
  }
}






