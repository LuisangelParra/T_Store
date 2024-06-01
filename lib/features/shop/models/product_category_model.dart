class ProductCategoryModel {
  final String productId;
  final String categoryId;

  ProductCategoryModel({
    required this.productId,
    required this.categoryId,
  });

  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'CategoryId': categoryId,
    };
  }

  factory ProductCategoryModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) {
      return ProductCategoryModel(productId: '', categoryId: '');
    }

    return ProductCategoryModel(
      productId: data['ProductId'] ?? '',
      categoryId: data['CategoryId'] ?? '',
    );
  }

  static ProductCategoryModel empty() =>
      ProductCategoryModel(productId: '', categoryId: '');
}
