import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungryfood/helpers/colorHelper.dart';
import 'package:like_button/like_button.dart';

import 'networks/api_provider.dart';
import 'resturantfooddetails/resturantfooddetails.dart';

class FoodResturantScreen extends StatefulWidget {
  const FoodResturantScreen({Key? key}) : super(key: key);

  @override
  State<FoodResturantScreen> createState() => _FoodResturantScreenState();
}

class _FoodResturantScreenState extends State<FoodResturantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: black,
          ),
        ),
        backgroundColor: white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "All Nearby Resturants",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
            fontSize: 16,
            color: black,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: hinttextColor.withOpacity(0.2),
                  child: TabBar(
                    indicatorColor: black,
                    unselectedLabelColor: black.withOpacity(0.5),
                    labelColor: primaryColor,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 14,
                    ),
                    tabs: const [
                      Tab(text: "Delievery"),
                      Tab(text: "Pickup"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(bottom: 160),
                  child: ListView.builder(
                    itemCount: similarfoodresturantlist.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                    color: black.withOpacity(0.5),
                                    blurRadius: 2,
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(
                                            () => RestutrantFoodListScreen(
                                              logo: similarfoodresturantlist[
                                                      index]
                                                  .image
                                                  .toString(),
                                              rating: int.parse(
                                                  similarfoodresturantlist[
                                                          index]
                                                      .rating
                                                      .toString()),
                                              resturantname:
                                                  similarfoodresturantlist[
                                                          index]
                                                      .resturnatName
                                                      .toString(),
                                              merchantId: int.parse(
                                                similarfoodresturantlist[index]
                                                    .merchatId
                                                    .toString(),
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              6,
                                          decoration: BoxDecoration(
                                            color: logoColor,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "${similarfoodresturantlist[index].image}"),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                height: 25,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: white,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      "${similarfoodresturantlist[index].time}",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: black,
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 16,
                                                      width: 1,
                                                      color: black,
                                                    ),
                                                    Text(
                                                      "${double.parse(similarfoodresturantlist[index].distance.toString()).round()}" +
                                                          ' Km',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 5,
                                        top: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: white),
                                          child: LikeButton(
                                            size: 40,
                                            circleColor: CircleColor(
                                                start: secondaryColor,
                                                end: secondaryColor),
                                            likeBuilder: (bool isLiked) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 2),
                                                child: Icon(
                                                  isLiked
                                                      ? Icons.favorite
                                                      : Icons
                                                          .favorite_border_outlined,
                                                  color: isLiked
                                                      ? Colors.red
                                                      : Colors.red,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${similarfoodresturantlist[index].resturnatName}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: black,
                                          ),
                                        ),
                                        Container(
                                          height: 20,
                                          // width: 50,
                                          decoration: BoxDecoration(
                                            color: ratingbarColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 3),
                                          child: Row(
                                            children: [
                                              Text(
                                                "${similarfoodresturantlist[index].rating}",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: white,
                                                ),
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: white,
                                                size: 14,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 10),
                                    child: Text(
                                      "${similarfoodresturantlist[index].cuisine}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: hinttextColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
