import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/data/services/cloud_storage/firebase_storage_service.dart';
import 'package:t_store/features/shop/models/category_models.dart';
import 'package:t_store/utils/constants/dummy_data.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  //Variables
  final _db = FirebaseFirestore.instance;
  final categoryLoading = false.obs;
  RxList<CategoryModel> allCategories = CategoryModel.emptyList().obs;

  //Get All Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      allCategories(list);
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

// Upload Categories to the Cloud Firesbase

  Future<void> uploadDummyData() async {
    try {
      categoryLoading.value = true;
      await getAllCategories();

      final categories = TDummyData.categories;
      final storage = Get.put(TFireBaseStorageService());

      for (var category in categories) {
        if (allCategories.any((element) => element.name == category.name)) {
          continue;
        }
        final file = await storage.getImageDataFromAssers(category.image);
        final url =
            await storage.uploadImageData('Categories', file, category.name);

        category.image = url;

        await _db.collection('Categories').add(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    } finally {
      categoryLoading.value = false;
    }
  }
}
