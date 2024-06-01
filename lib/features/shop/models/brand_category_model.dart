class BrandCategoryModel {
  final String brandId;
  final String categoryId;

  BrandCategoryModel({
    required this.brandId,
    required this.categoryId,
  });

  Map<String, dynamic> toJson() {
    return {
      'BrandId': brandId,
      'CategoryId': categoryId,
    };
  }

  factory BrandCategoryModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) {
      return BrandCategoryModel(brandId: '', categoryId: '');
    }

    return BrandCategoryModel(
      brandId: data['BrandId'] ?? '',
      categoryId: data['CategoryId'] ?? '',
    );
  }

  static BrandCategoryModel empty() =>
      BrandCategoryModel(brandId: '', categoryId: '');
}
