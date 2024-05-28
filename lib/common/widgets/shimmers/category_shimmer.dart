import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>
            const SizedBox(width: TSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TShimmerEffect(
                height: 55,
                width: 55,
                radius: 55,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              TShimmerEffect(
                height: 8,
                width: 55,
              ),
            ],
          );
        },
      ),
    );
  }
}
