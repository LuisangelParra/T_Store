import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';

import '../../../../utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1- Product Image Slider
            const TProductImageSlider(),

            /// 2- Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// - Rating & Share
                  Row(
                    children: [
                      /// Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Iconsax.star5,
                            color: Colors.amber,
                            size: 24,
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems / 2,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: '5.0',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                                const TextSpan(text: '(199)'),
                              ],
                            ),
                          ),
                        ],
                      ),

                      /// Share Button
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.share,
                            size: TSizes.iconMd,
                          )),
                    ],
                  )

                  /// - Price, Title, Stock, & Brand
                  /// -- Attributes
                  /// -- Checkout Button
                  /// - Description
                  /// - Reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
