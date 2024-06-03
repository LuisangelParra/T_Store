import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

import '../../../utils/constants/dummy_data.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/loaders.dart';

class ProductCategoryController extends GetxController {
  static ProductCategoryController get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // Upload product-category to the Cloud Firesbase
  uploadDummyData() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Uploading Product Categories Relational data...',
          TImages.cloudUploadingAnimation);

      isLoading.value = true;
      final relations = TDummyData.productCategories;

      for (var relation in relations) {
        await _db.collection('ProductCategory').add(relation.toJson());
      }

      TFullScreenLoader.stopLoading();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
