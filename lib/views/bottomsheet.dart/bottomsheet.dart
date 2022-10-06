import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungryfood/views/bottomsheet.dart/bottomsheetenum.dart';
import 'package:hungryfood/views/cartscreen.dart';
import 'package:like_button/like_button.dart';

import '../../helpers/colorHelper.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  QunatityTypeEnum? _qunatityTypeEnum = QunatityTypeEnum.half;

  int _count = 0;

  void addCount() {
    setState(() {
      _count++;
    });
  }

  void addMinust() {
    setState(() {
      if (_count == 0) {
        // do nothing
      } else {
        _count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            height: 140,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: logoColor,
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                  image: AssetImage("assets/b.jpg"), fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Food Item name",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: black,
                ),
              ),
              Row(
                children: [
                  LikeButton(
                    size: 40,
                    circleColor: CircleColor(
                      start: secondaryColor,
                      end: secondaryColor,
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        isLiked
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: isLiked ? Colors.red : Colors.red,
                      );
                    },
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                    color: logoColor,
                    iconSize: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: hinttextColor,
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Quantity",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: black,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 25,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "half",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: black,
                ),
              ),
              Transform.scale(
                scale: 0.8,
                child: Radio<QunatityTypeEnum>(
                    value: QunatityTypeEnum.half,
                    groupValue: _qunatityTypeEnum,
                    onChanged: (value) {
                      setState(() {
                        _qunatityTypeEnum = value;
                      });
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "full",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: black,
                ),
              ),
              Transform.scale(
                scale: 0.8,
                child: Radio<QunatityTypeEnum>(
                    value: QunatityTypeEnum.full,
                    groupValue: _qunatityTypeEnum,
                    onChanged: (value) {
                      setState(() {
                        _qunatityTypeEnum = value;
                      });
                    }),
              ),
            ],
          ),
        ),
        Divider(
          color: hinttextColor,
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Total Price:",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "260 \$",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: logoColor,
                    ),
                  ),
                ],
              ),
              Container(
                height: 35,
                decoration: BoxDecoration(
                  color: logoColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: addMinust,
                        child: Icon(
                          Icons.remove,
                          color: white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "$_count",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: addCount,
                        child: Icon(
                          Icons.add,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: CupertinoButton(
            child: Container(
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "View Cart",
                  style: TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: white,
                  ),
                ),
              ),
            ),
            onPressed: () => Get.off(() => const ViewCartScreen()),
          ),
        ),
      ],
    );
  }
}
