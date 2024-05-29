import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String id;
  String imageUrl; // Changed from image to imageUrl
  String targetScreen; // Changed from title to Target
  bool active;

  BannerModel({
    required this.id,
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  static BannerModel empty() => BannerModel(
        id: '',
        imageUrl: '',
        targetScreen: '',
        active: false,
      );

  static List<BannerModel> emptyList() => [];

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'targetScreen': targetScreen,
      'active': active,
    };
  }

  factory BannerModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    return BannerModel(
      id: document.id,
      imageUrl: document['imageUrl'] ?? '',
      targetScreen: document['targetScreen'] ?? '',
      active: document['active'] ?? false,
    );
  }
}
