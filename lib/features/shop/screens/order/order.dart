import 'package:flutter/material.dart';
import 'package:grocify/common/widgets/appbar/appbar.dart';
import 'package:grocify/features/shop/screens/order/widgets/orders_list.dart';
import 'package:grocify/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// --- App Bar
      appBar: TAppBar(title: Text('My Orders',style: Theme.of(context).textTheme.headlineSmall,),showBackArrow: true,),

      body: const Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
      child: TOrderListItems(),
      ),
    );
  }
}
