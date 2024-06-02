import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/product/images_contoller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/models/product_variation_model.dart';

class VariationController extends GetxController {
  static VariationController get to => Get.find();

  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
      (variation) => _isSameAttributeValues(
          variation.attributesValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value =
          selectedVariation.image;
    }

    this.selectedVariation.value = selectedVariation;
  }

  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) {
      return false;
    }

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) {
        return false;
      }
    }

    return true;
  }

  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttributeValues = variations
        .where((variation) =>
            variation.attributesValues[attributeName] != null &&
            variation.attributesValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        .map((variation) => variation.attributesValues[attributeName])
        .toSet();

    return availableVariationAttributeValues;
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toString();
  }

  void getProductVariationStockStatus(ProductModel product) {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
