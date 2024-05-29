import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl; // Changed from image to imageUrl
  final String targetScreen; // Changed from title to Target
  final bool active;

  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  static BannerModel empty() => BannerModel(
        imageUrl: '',
        targetScreen: '',
        active: false,
      );

  bannerName() => imageUrl.split('/').last;

  static List<BannerModel> emptyList() => [];

  Map<String, dynamic> toJson() {
    return {
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
      'Active': active,
    };
  }

  factory BannerModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    return BannerModel(
      imageUrl: document['ImageUrl'] ?? '',
      targetScreen: document['TargetScreen'] ?? '',
      active: document['Active'] ?? false,
    );
  }
}
