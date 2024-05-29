import 'package:get/get.dart';
import 'package:t_store/data/repositories/banners/banner_repository.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../utils/constants/image_strings.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  RxList<BannerModel> banners = <BannerModel>[].obs;
  final _bannerRepository = Get.put(BannerRepository());

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  /// -- Load category data from Firestore
  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;

      final bannersRepo = Get.put(BannerRepository());
      final banners = await bannersRepo.fetchBanners();

      this.banners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //Remove loader
      isLoading.value = false;
    }
  }

  // Upload Categories to the Cloud Firesbase
  uploadDummyData() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Uploading banners data...', TImages.cloudUploadingAnimation);

      await _bannerRepository.uploadDummyData();

      fetchBanners();
      TFullScreenLoader.stopLoading();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
