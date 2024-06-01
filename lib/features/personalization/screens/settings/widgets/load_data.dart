import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/list_tiles/upload_data_tile.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/banner_controller.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/controllers/product_controller.dart';

import '../../../../../utils/constants/sizes.dart';

class UploadData extends StatelessWidget {
  const UploadData({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;
    final bannersController = BannerController.instance;
    final productsController = ProductController.instance;

    return Scaffold(
      appBar: const TAppBar(
        title: Text('Upload Data'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            const TSectionHeading(
                title: 'Main Record', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),
            TUploadDataMenuTile(
              title: 'Upload Categories',
              icon: Iconsax.category,
              icon2: Iconsax.arrow_up_1,
              onTap: () => categoryController.uploadDummyData(),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            const TUploadDataMenuTile(
              title: 'Upload Brands',
              icon: Iconsax.shop,
              icon2: Iconsax.arrow_up_1,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            TUploadDataMenuTile(
              title: 'Upload Products',
              icon: Iconsax.shopping_cart,
              icon2: Iconsax.arrow_up_1,
              onTap: () => productsController.uploadDummyData(),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            TUploadDataMenuTile(
              title: 'Upload Banners',
              icon: Iconsax.image,
              icon2: Iconsax.arrow_up_1,
              onTap: () => bannersController.uploadDummyData(),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            const TSectionHeading(
                title: 'Relationships', showActionButton: false),
            const Text(
                'Make sure you have already uploaded the content above.'),
            const SizedBox(height: TSizes.spaceBtwItems),
            const TUploadDataMenuTile(
              title: 'Upload Brand & Category Relation Data',
              icon: Iconsax.link_2,
              icon2: Iconsax.arrow_up_1,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            const TUploadDataMenuTile(
              title: 'Upload Product Categories Relational Data',
              icon: Iconsax.link_2,
              icon2: Iconsax.arrow_up_1,
            ),
          ],
        ),
      ),
    );
  }
}
