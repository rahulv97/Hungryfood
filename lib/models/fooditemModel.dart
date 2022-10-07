// ignore_for_file: file_names

class FoodItemModel {
  String? image;
  String? foodName;
  String? price;
  String? details;
  String? discountPrice;
  String? discountType;

  FoodItemModel({
    this.image,
    required this.foodName,
    required this.price,
    this.discountPrice,
    required this.details,
    required this.discountType,
  });
}
