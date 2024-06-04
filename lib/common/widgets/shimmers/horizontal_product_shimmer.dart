import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class THorizontalProductShimmer extends StatelessWidget{
  const THorizontalProductShimmer({
    super.key, this.itemCount = 4,
  });

  final int itemCount;
  
  @override
  Widget build(BuildContext context) {
    
    throw Container(
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems),
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TShimmerEffect(height: 120, width: 120),
            SizedBox(width: TSizes.spaceBtwItems),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: TSizes.spaceBtwItems/2),
                TShimmerEffect(height: 10, width: 100),
                SizedBox(height: TSizes.spaceBtwItems/2),
                TShimmerEffect(height: 10, width: 80),
                SizedBox(height: TSizes.spaceBtwItems/2),
              ],
            )
          ],
        ),
      )
    );
  }
}