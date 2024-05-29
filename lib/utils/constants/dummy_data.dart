import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/features/shop/models/category_model.dart';

import 'image_strings.dart';
import '../../routes/routes.dart';

class TDummyData {
  /// -- List of all banners
  static final List<BannerModel> banners = [
    BannerModel(
      imageUrl: TImages.promoBanner1,
      targetScreen: TRoutes.order,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.promoBanner2,
      targetScreen: TRoutes.favourites,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.promoBanner3,
      targetScreen: TRoutes.cart,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.banner1,
      targetScreen: TRoutes.order,
      active: false,
    ),
    BannerModel(
      imageUrl: TImages.banner2,
      targetScreen: TRoutes.order,
      active: false,
    ),
    BannerModel(
      imageUrl: TImages.banner3,
      targetScreen: TRoutes.order,
      active: false,
    ),
    BannerModel(
      imageUrl: TImages.banner4,
      targetScreen: TRoutes.order,
      active: false,
    ),
    BannerModel(
      imageUrl: TImages.banner5,
      targetScreen: TRoutes.order,
      active: false,
    ),
    BannerModel(
      imageUrl: TImages.banner6,
      targetScreen: TRoutes.order,
      active: false,
    ),
    BannerModel(
      imageUrl: TImages.banner8,
      targetScreen: TRoutes.order,
      active: false,
    ),
  ];

  /// -- List of all categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Electronics',
        image: TImages.electronicsIcon,
        isFeatured: true),
    CategoryModel(
        id: '3', name: 'Clothes', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(
        id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(
        id: '5',
        name: 'Furniture',
        image: TImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: '6', name: 'Shoes', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(
        id: '7',
        name: 'Cosmetics',
        image: TImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: '8', name: 'Books', image: TImages.jeweleryIcon, isFeatured: true),

    // Sub Categories
    CategoryModel(
        id: '9',
        name: 'Sport Shoes',
        image: TImages.sportIcon,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '10',
        name: 'Track Suits',
        image: TImages.sportIcon,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '11',
        name: 'Sports Equipment',
        image: TImages.sportIcon,
        isFeatured: false,
        parentId: '1'),

    //furniture
    CategoryModel(
        id: '12',
        name: 'Bedroom furniture',
        image: TImages.furnitureIcon,
        isFeatured: false,
        parentId: '5'),
    CategoryModel(
        id: '13',
        name: 'Kitchen furniture',
        image: TImages.furnitureIcon,
        isFeatured: false,
        parentId: '5'),
    CategoryModel(
        id: '14',
        name: 'Office furniture',
        image: TImages.furnitureIcon,
        isFeatured: false,
        parentId: '5'),

    //electronics
    CategoryModel(
        id: '15',
        name: 'Laptop',
        image: TImages.electronicsIcon,
        isFeatured: false,
        parentId: '2'),
    CategoryModel(
        id: '16',
        name: 'Mobile',
        image: TImages.electronicsIcon,
        isFeatured: false,
        parentId: '2'),

    CategoryModel(
        id: '17',
        name: 'Shirts',
        image: TImages.clothIcon,
        isFeatured: false,
        parentId: '3'),
  ];
}
