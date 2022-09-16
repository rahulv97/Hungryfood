import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/route_manager.dart';
import 'package:hungryfood/helpers/colorHelper.dart';
import 'package:hungryfood/views/cartscreen.dart';
import 'package:like_button/like_button.dart';

class RestutrantFoodListScreen extends StatefulWidget {
  const RestutrantFoodListScreen({Key? key}) : super(key: key);

  @override
  State<RestutrantFoodListScreen> createState() =>
      _RestutrantFoodListScreenState();
}

class _RestutrantFoodListScreenState extends State<RestutrantFoodListScreen> {
  List foodList = [
    'All foods',
    'Indian',
    'Deli',
    'Pizza ',
    'Sandwich',
    'Breakfast',
    'Chines',
    'All foods',
    'Indian',
    'Deli',
    'Pizza ',
    'Sandwich',
    'Breakfast',
    'Chines'
  ];

  int _selectedIndex = 0;

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

  double value = 3.5;

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
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/a.jpg",
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
                                    image: const DecorationImage(
                                      image: AssetImage("assets/pizzahut.png"),
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
                                    "Pizza hut",
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
                                        value: value,
                                        onValueChanged: (v) {
                                          //
                                          setState(() {
                                            value = v;
                                          });
                                        },
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
                                        setState(() => _selectedIndex = index);
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
                                          foodList[index].toString(),
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
                            itemCount: 10,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        child: Text(
                                          "Food Item name",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            color: black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          "Food Description",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: black.withOpacity(0.4),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "26,999 \$",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: logoColor,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  "2 % off",
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
                                                showModalBottomSheet<void>(
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
                                                    return SingleChildScrollView(
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const SizedBox(
                                                              height: 20),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        25),
                                                            child: Container(
                                                              height: 140,
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    logoColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                image: const DecorationImage(
                                                                    image: AssetImage(
                                                                        "assets/b.jpg"),
                                                                    fit: BoxFit
                                                                        .cover),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 10),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        15),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  "Food Item name",
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        16,
                                                                    color:
                                                                        black,
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    LikeButton(
                                                                      size: 40,
                                                                      circleColor:
                                                                          CircleColor(
                                                                        start:
                                                                            secondaryColor,
                                                                        end:
                                                                            secondaryColor,
                                                                      ),
                                                                      likeBuilder:
                                                                          (bool
                                                                              isLiked) {
                                                                        return Icon(
                                                                          isLiked
                                                                              ? Icons.favorite
                                                                              : Icons.favorite_border_outlined,
                                                                          color: isLiked
                                                                              ? Colors.red
                                                                              : Colors.red,
                                                                        );
                                                                      },
                                                                    ),
                                                                    IconButton(
                                                                      onPressed:
                                                                          () {},
                                                                      icon: const Icon(
                                                                          Icons
                                                                              .share),
                                                                      color:
                                                                          logoColor,
                                                                      iconSize:
                                                                          20,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            color:
                                                                hinttextColor,
                                                            thickness: 1,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child: Text(
                                                              "Quantity",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 14,
                                                                color: black,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 10),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  "half",
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        14,
                                                                    color:
                                                                        black,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: 10,
                                                                  width: 10,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        logoColor,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    height: 8,
                                                                    width: 8,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color:
                                                                          white,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      height: 6,
                                                                      width: 6,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color:
                                                                            logoColor,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 10),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  "full",
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        14,
                                                                    color:
                                                                        black,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: 10,
                                                                  width: 10,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        logoColor,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    height: 8,
                                                                    width: 8,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color:
                                                                          white,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      height: 6,
                                                                      width: 6,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color:
                                                                            logoColor,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            color:
                                                                hinttextColor,
                                                            thickness: 1,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        15),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Total Price:",
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            black,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            10),
                                                                    Text(
                                                                      "260 \$",
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            logoColor,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  height: 35,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        logoColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            8),
                                                                    child: Row(
                                                                      children: [
                                                                        GestureDetector(
                                                                          onTap:
                                                                              addMinust,
                                                                          child:
                                                                              Icon(
                                                                            Icons.remove,
                                                                            color:
                                                                                white,
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                            width:
                                                                                10),
                                                                        Text(
                                                                          "$_count",
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                white,
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                            width:
                                                                                10),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              addCount,
                                                                          child:
                                                                              Icon(
                                                                            Icons.add,
                                                                            color:
                                                                                white,
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
                                                            child:
                                                                CupertinoButton(
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40,
                                                                      width:
                                                                          120,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color:
                                                                            secondaryColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          "View Cart",
                                                                          style:
                                                                              TextStyle(
                                                                            letterSpacing:
                                                                                1,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      Get.to(() =>
                                                                          const ViewCartScreen());
                                                                      print(
                                                                          "object");
                                                                    }),
                                                          ),
                                                        ],
                                                      ),
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
