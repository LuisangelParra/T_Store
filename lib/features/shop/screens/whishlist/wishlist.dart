import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets/layouts/grid_layouts.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/shimmers/vertica_product_shimmer.dart';
import 'package:t_store/features/shop/controllers/product/favourites_controller.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';

import '../../../../utils/constants/image_strings.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              FutureBuilder(
                  future: controller.favoriteProducts(),
                  builder: (context, snapshot) {
                    final emptyWidget = TAnimationLoaderWidget(
                      text: 'Whoops! Wishlist is Empty...',
                      animation: TImages.pencilAnimation,
                      showAction: true,
                      actionText: 'Let\'s add some',
                      onActionPressed: () => Get.to(const NavigationMenu()),
                    );

                    const loader = TVerticalProductShimmer(
                      itemCount: 6,
                    );
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot,
                        loader: loader,
                        nothingFound: emptyWidget);
                    if (widget != null) return widget;

                    final products = snapshot.data!;
                    return TGridLayaout(
                      itemCount: products.length,
                      itemBuilder: (_, index) => TProductCardVertical(
                        product: products[index],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
