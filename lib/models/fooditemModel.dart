import 'package:flutter/material.dart';

class FoodItemModel {
  String? image;
  String? foodName;
  String? price;
  String? details;
  String? discountPrice;

  FoodItemModel({
    required this.image,
    required this.foodName,
    required this.price,
    this.discountPrice,
    required this.details,
  });
}
