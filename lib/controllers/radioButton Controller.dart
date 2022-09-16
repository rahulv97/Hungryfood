import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioButtonController extends GetxController {
  String _orderType = 'half';
  String get orderType => _orderType;

  void setOrdertype(String type) {
    _orderType = type;
    update();
  }
}
