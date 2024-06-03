import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

import '../../../utils/constants/dummy_data.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/loaders.dart';

class BrandCategoryController extends GetxController {
  static BrandCategoryController get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // Upload brand-category to the Cloud Firesbase
  uploadDummyData() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Uploading Brand Categories Relational data...',
          TImages.cloudUploadingAnimation);

      isLoading.value = true;
      final relations = TDummyData.brandCategory;

      for (var relation in relations) {
        await _db
            .collection('BrandCategory')
            .doc(relation.brandId)
            .set(relation.toJson());
      }

      TFullScreenLoader.stopLoading();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
