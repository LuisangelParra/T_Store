import 'package:get/get.dart';
import 'package:t_store/data/repositories/categories/category_repository.dart';
import 'package:t_store/data/repositories/products/product_repository.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../utils/constants/image_strings.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  final productRepository = Get.put(ProductRepository());

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> subCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// -- Load category data from Firestore
  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();

      allCategories.assignAll(categories);

      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //Remove loader
      isLoading.value = false;
    }
  }

  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try{
      final subCategories = await _categoryRepository.getSubCategories(categoryId);
      this.subCategories.assignAll(subCategories);
      return subCategories;
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // Load Selected Category data
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = 4}) async {
    try{
      final products = await productRepository.getProductsForCategory(
        categoryId: categoryId, limit: limit);
    return products;

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // Upload Categories to the Cloud Firesbase
  uploadDummyData() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Uploading categories data...', TImages.cloudUploadingAnimation);

      await _categoryRepository.uploadDummyData();

      fetchCategories();
      TFullScreenLoader.stopLoading();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
