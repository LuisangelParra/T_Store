import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class TBoxesShimmer extends StatelessWidget {
  const TBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: TShimmerEffect(height: 110, width: 150)),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: TShimmerEffect(height: 110, width: 150)),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: TShimmerEffect(height: 110, width: 150)),
            SizedBox(width: TSizes.spaceBtwItems),
          ],
        ),
      ],
    );
  }
}
