import 'package:flutter/material.dart';
import 'package:hungryfood/helpers/colorHelper.dart';

class MyCustomBorder {
  myCustomBorder(BuildContext context) {
    var customDesign = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
    );
    return customDesign;
  }
}

class MyCustomErrorBorder {
  myCustomErrorBorder(BuildContext context) {
    var customError = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
    );
    return customError;
  }
}

class MyCustomFocusErrorBorder {
  myCustomFocusErrorBorder(BuildContext context) {
    var customError = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
    );
    return customError;
  }
}

class FloatingTextStyle {
  floatingStyle(BuildContext context) {
    var label = TextStyle(
      fontFamily: 'Segoe UI',
      fontSize: 16,
      color: primaryColor,
      fontWeight: FontWeight.w600,
    );
    return label;
  }
}

class LabelStyle {
  lebel(BuildContext context) {
    var labelStyle = TextStyle(
      fontFamily: 'Segoe UI',
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
    return labelStyle;
  }
}

class CustomBorder {
  customeOutline(BuildContext context) {
    var design = OutlineInputBorder();
  }
}
