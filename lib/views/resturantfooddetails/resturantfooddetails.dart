import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/route_manager.dart';
import 'package:hungryfood/helpers/colorHelper.dart';
import 'package:hungryfood/models/foodcategorymodel.dart';
import 'package:hungryfood/models/fooditemModel.dart';
import 'package:like_button/like_button.dart';
import '../bottomsheet.dart/bottomsheet.dart';
import '../networks/api_constant.dart';
import '../networks/http_request.dart';
import 'package:http/http.dart' as http;

class RestutrantFoodListScreen extends StatefulWidget {
  final String logo;
  final int rating;
  final String resturantname;
  final int merchantId;
  final String headerimage;
  const RestutrantFoodListScreen(
      {Key? key,
      required this.logo,
      required this.rating,
      required this.resturantname,
      required this.merchantId,
      required this.headerimage})
      : super(key: key);

  @override
  State<RestutrantFoodListScreen> createState() =>
      _RestutrantFoodListScreenState();
}

class _RestutrantFoodListScreenState extends State<RestutrantFoodListScreen> {
  int _selectedIndex = 0;

  double value = 3.5;

  List<FoodItemModel> fooditemList = [];

  List<FoodCategoryModel> foodList = [];
  var body;

  @override
  void initState() {
    ApiRequest().postRequest(
        ApiConstant().baseUrl, ApiConstant().getresturantcategories, {
      'merchant_id': widget.merchantId.toString(),
      'YII_CSRF_TOKEN':
          'MVhvWmltTnRVY1FzTUVMb1RGQnBWcEdCTTYyazZGMGxIvxpxNjovK4-kr_5f_OGYzN8wZ2f8NtDlCmo9POieVw==',
    }).then((value) {
      // ignore: unused_local_variable

      setState(() {
        Map<String, dynamic> map = jsonDecode(value);
        List a = map["details"]["data"]['category'];
        foodList.clear();
        foodList.add(
          FoodCategoryModel(
            categoryName: 'All Foods',
            categoryId: '-1',
          ),
        );
        for (int i = 0; i < a.length; i++) {
          foodList.add(
            FoodCategoryModel(
              categoryName: a[i]['category_name'],
              categoryId: a[i]['cat_id'],
            ),
          );
        }
      });
    });

    ApiRequest().postRequest(
        ApiConstant().baseUrl, ApiConstant().getresturantfooditems, {
      'merchant_id': widget.merchantId.toString(),
      'YII_CSRF_TOKEN':
          'MVhvWmltTnRVY1FzTUVMb1RGQnBWcEdCTTYyazZGMGxIvxpxNjovK4-kr_5f_OGYzN8wZ2f8NtDlCmo9POieVw==',
    }).then((value) {
      setState(() {
        fooditemList.clear();
        Map<dynamic, dynamic> map = jsonDecode(value);

        List cat = map["details"]["data"]["category"];

        List itemID = [];

        for (var items in cat) {
          itemID.addAll(items["items"]);
        }

        for (String it in itemID) {
          //Make Model and then save all items data in list
          String itg =
              map["details"]["data"]["items"][it]["item_name"].toString();
          print(itg);

          fooditemList.add(
            FoodItemModel(
              image:
                  map["details"]["data"]["items"][it]["url_image"].toString(),
              foodName:
                  map["details"]["data"]["items"][it]["item_name"].toString(),
              price: map["details"]["data"]["items"][it]["price"][0]
                      ['pretty_price_after_discount']
                  .toString(),
              details: map["details"]["data"]["items"][it]["item_description"]
                  .toString(),
              discountPrice: map["details"]["data"]["items"][it]["price"][0]
                      ["discount"]
                  .toString(),
              discountType: map["details"]["data"]["items"][it]["price"][0]
                      ["discount_type"]
                  .toString(),
            ),
          );
        }
      });
    });

    http.get(Uri.parse(widget.headerimage)).then((value) {
      setState(() {
        body = value.body
            .toString()
            .split('background: url("')[1]
            .split('") no-repeat center center')
            .first;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3,
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height / 3.5,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        body ?? widget.logo,
                                      ),
                                      fit: BoxFit.cover),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 30, horizontal: 10),
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: hinttextColor.withOpacity(0.1),
                                          shape: BoxShape.circle),
                                      child: IconButton(
                                        icon: const Icon(Icons.arrow_back),
                                        color: white,
                                        iconSize: 30,
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 110,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: white,
                                    image: DecorationImage(
                                      image: NetworkImage(widget.logo),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    widget.resturantname,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                      fontSize: 20,
                                      color: black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    children: [
                                      RatingStars(
                                        value: double.parse(
                                            widget.rating.toString()),
                                        starBuilder: (index, color) => Icon(
                                          Icons.star,
                                          color: color,
                                          size: 20,
                                        ),
                                        starCount: 5,
                                        starSize: 20,
                                        maxValue: 5,
                                        starSpacing: 0.5,
                                        maxValueVisibility: true,
                                        valueLabelVisibility: false,
                                        animationDuration:
                                            const Duration(milliseconds: 1000),
                                        starOffColor: const Color(0xffe7e8ea),
                                        starColor: secondaryColor,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "(455 review)",
                                        style: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 12,
                                            color: black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: white,
                                    border: Border.all(
                                      color: hinttextColor,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.info_outline),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 1,
                                        color: hinttextColor,
                                      ),
                                      LikeButton(
                                        size: 40,
                                        circleColor: CircleColor(
                                            start: secondaryColor,
                                            end: secondaryColor),
                                        likeBuilder: (bool isLiked) {
                                          return Icon(
                                            isLiked
                                                ? Icons.favorite
                                                : Icons
                                                    .favorite_border_outlined,
                                            color: isLiked
                                                ? Colors.red
                                                : Colors.red,
                                          );
                                        },
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: foodList.length,
                              itemBuilder: (context, int index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Align(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedIndex = index;
                                          var cat_id =
                                              foodList[index].categoryId;
                                          ApiRequest().postRequest(
                                              ApiConstant().baseUrl,
                                              ApiConstant()
                                                  .getresturantfooditems,
                                              {
                                                'merchant_id': widget.merchantId
                                                    .toString(),
                                                'YII_CSRF_TOKEN':
                                                    'MVhvWmltTnRVY1FzTUVMb1RGQnBWcEdCTTYyazZGMGxIvxpxNjovK4-kr_5f_OGYzN8wZ2f8NtDlCmo9POieVw==',
                                              }).then((value) {
                                            setState(() {
                                              fooditemList.clear();
                                              Map<dynamic, dynamic> map =
                                                  jsonDecode(value);

                                              List cat = map["details"]["data"]
                                                  ["category"];

                                              List itemID = [];

                                              for (var items in cat) {
                                                if (cat_id == items['cat_id']) {
                                                  itemID.addAll(items["items"]);
                                                } else if (cat_id == '-1') {
                                                  itemID.addAll(items["items"]);
                                                }
                                              }

                                              for (String it in itemID) {
                                                //Make Model and then save all items data in list
                                                String itg = map["details"]
                                                            ["data"]["items"]
                                                        [it]["item_name"]
                                                    .toString();
                                                print(itg);

                                                fooditemList.add(
                                                  FoodItemModel(
                                                    image: map["details"]
                                                                    ["data"]
                                                                ["items"][it]
                                                            ["url_image"]
                                                        .toString(),
                                                    foodName: map["details"]
                                                                    ["data"]
                                                                ["items"][it]
                                                            ["item_name"]
                                                        .toString(),
                                                    price: map["details"]
                                                                        ["data"]
                                                                    ["items"]
                                                                [it]["price"][0]
                                                            [
                                                            'pretty_price_after_discount']
                                                        .toString(),
                                                    details: map["details"]
                                                                    ["data"]
                                                                ["items"][it]
                                                            ["item_description"]
                                                        .toString(),
                                                    discountPrice:
                                                        map["details"]["data"][
                                                                        "items"]
                                                                    [
                                                                    it]["price"]
                                                                [0]["discount"]
                                                            .toString(),
                                                    discountType: map["details"]
                                                                        ["data"]
                                                                    ["items"]
                                                                [it]["price"][0]
                                                            ["discount_type"]
                                                        .toString(),
                                                  ),
                                                );
                                              }
                                            });
                                          });
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          // ignore: unnecessary_null_comparison
                                          color: _selectedIndex != null &&
                                                  _selectedIndex == index
                                              ? logoColor
                                              : null,
                                        ),
                                        child: Text(
                                          foodList[index]
                                              .categoryName
                                              .toString(),
                                          style: TextStyle(
                                            // ignore: unnecessary_null_comparison
                                            color: _selectedIndex != null &&
                                                    _selectedIndex == index
                                                ? white
                                                : primaryColor,
                                            fontFamily: 'Segoe UI',
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 20),
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: fooditemList.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: black,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    fooditemList[index]
                                                        .foodName
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18,
                                                      color: black,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    fooditemList[index]
                                                        .details
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: black
                                                          .withOpacity(0.4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            fooditemList[index]
                                                    .image!
                                                    .contains('default-image')
                                                ? Container()
                                                : Container(
                                                    width: 120,
                                                    height: 70,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                            fooditemList[index]
                                                                .image
                                                                .toString(),
                                                          ),
                                                          fit: BoxFit.cover),
                                                    ),
                                                  )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  fooditemList[index]
                                                      .price
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: logoColor,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  fooditemList[index]
                                                              .discountType
                                                              .toString() ==
                                                          'fixed'
                                                      // ignore: unnecessary_string_interpolations
                                                      ? "${fooditemList[index].discountPrice.toString()}" +
                                                          "€"
                                                      // ignore: unnecessary_string_interpolations
                                                      : "${fooditemList[index].discountPrice.toString()}" +
                                                          "%",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: secondaryColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20),
                                                      topRight:
                                                          Radius.circular(20),
                                                    ),
                                                  ),
                                                  backgroundColor: white,
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return const SingleChildScrollView(
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      child:
                                                          BottomSheetScreen(),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  color: logoColor,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 7),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Add",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                          color: white,
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.add,
                                                        color: white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
