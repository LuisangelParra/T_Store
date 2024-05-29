import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/data/services/cloud_storage/firebase_storage_service.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/constants/dummy_data.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final bannersLoading = false.obs;

  Future<List<BannerModel>> fetchBanners() async {
    try {
      final snapshot = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      final list = snapshot.docs
          .map((document) => BannerModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  Future<void> uploadDummyData() async {
    try {
      bannersLoading.value = true;
      await fetchBanners();

      final banners = TDummyData.banners;
      final storage = Get.put(TFireBaseStorageService());

      //  Drop old data and upload new data
      await _db.collection('Banners').get().then((snapshot) {
        for (DocumentSnapshot ds in snapshot.docs) {
          ds.reference.delete();
        }
      });

      for (var banner in banners) {
        final file = await storage.getImageDataFromAssets(banner.imageUrl);
        final url =
            await storage.uploadImageData('Banners', file, banner.bannerName());

        banner.imageUrl = url;

        await _db.collection('Banners').add(banner.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    } finally {
      bannersLoading.value = false;
    }
  }
}
