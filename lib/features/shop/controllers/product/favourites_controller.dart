import 'dart:convert';

import 'package:get/get.dart';
import 'package:t_store/data/repositories/products/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';
import 'package:t_store/utils/popups/loaders.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  final favorites = <String, bool>{}.obs;
  final _productRepository = Get.put(ProductRepository());

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  void initFavourites() async {
    final json = TLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoriteToStorage();
      TLoaders.customToast(message: 'Product has been added to the Wishlist');
    } else {
      TLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoriteToStorage();
      favorites.refresh();
      TLoaders.customToast(
          message: 'Product has been removed from the Wishlist');
    }
  }

  void saveFavoriteToStorage() {
    final encodedFavorites = json.encode(favorites);
    TLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await _productRepository
        .getFavouriteProducts(favorites.keys.toList());
  }
}
