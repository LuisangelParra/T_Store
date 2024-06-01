import 'package:flutter/widgets.dart';
import 'package:t_store/common/widgets/layouts/grid_layouts.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayaout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TShimmerEffect(width: 180, height: 180),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TShimmerEffect(width: 160, height: 15),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            TShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
