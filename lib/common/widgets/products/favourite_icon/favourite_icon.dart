import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/features/shop/controllers/product/favourites_controller.dart';

import '../../../../utils/constants/colors.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
      () => TCircularIcon(
        icon: controller.isFavorite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavorite(productId) ? TColors.error : null,
        onPressed: () => controller.toggleFavoriteProduct(productId),
      ),
    );
  }
}
