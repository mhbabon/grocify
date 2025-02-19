import 'package:flutter/material.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:grocify/features/shop/screens/home/widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                // App Bar
                THomeAppBar(),


                // Search Bar

                //Categories


              ],
            )),
          ],
        ),
      ),
    );
  }
}
