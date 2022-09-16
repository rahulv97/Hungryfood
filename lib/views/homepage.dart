import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hungryfood/controllers/fooditem_Controller.dart';
import 'package:hungryfood/helpers/colorHelper.dart';
import 'package:hungryfood/helpers/custombottompage.dart';
import 'package:hungryfood/views/drawer/drawer.dart';
import 'package:hungryfood/views/food_resturant_list.dart';
import 'package:hungryfood/views/onBoardingPages/onBoardingPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  List imgData = [
    "assets/banner.png",
    "assets/banner.png",
    "assets/banner.png",
    "assets/banner.png",
    "assets/banner.png",
    "assets/banner.png",
    "assets/banner.png",
    "assets/banner.png",
    "assets/banner.png",
  ];

  int _selectedIndex = 0;

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const SideBarScreen(),
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        actions: [
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "5GF+JMF,Location-name...",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                    fontSize: 14,
                    color: black,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: black,
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('showHome', false);
                    Get.offAll(() => const OnBoardingPage());
                  },
                  icon: const Icon(Icons.logout),
                  color: black,
                )
              ],
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: DefaultTabController(
                length: 2,
                child: SingleChildScrollView(
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
                      const SizedBox(height: 10),
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
                                        borderRadius: BorderRadius.circular(15),
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
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: CarouselSlider.builder(
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            autoPlay: true,
                            viewportFraction: 1.9,
                            reverse: false,
                            autoPlayInterval: const Duration(seconds: 2),
                            onPageChanged: (index, reason) =>
                                setState(() => activeIndex = index),
                          ),
                          itemCount: imgData.length,
                          itemBuilder: (context, index, realindex) {
                            return SizedBox(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: Image(
                                image: AssetImage("${imgData[index]}"),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      buildIndicator(),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Reviewed item",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: black,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "View All",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.only(bottom: 150),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: FoodItemController().fooditemList.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (BuildContext context, index) {
                            return Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
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
                                        ]),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() =>
                                                const FoodResturantScreen());
                                          },
                                          child: Container(
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: logoColor,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "${FoodItemController().fooditemList[index].image}"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "${FoodItemController().fooditemList[index].foodName}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: black,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "${FoodItemController().fooditemList[index].details}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: hinttextColor,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text:
                                                  "${FoodItemController().fooditemList[index].discountPrice}",
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontWeight: FontWeight.bold,
                                                color: red,
                                                letterSpacing: 1,
                                                fontSize: 10,
                                              ),
                                            ),
                                            const WidgetSpan(
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  "${FoodItemController().fooditemList[index].price}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: black,
                                                letterSpacing: 1,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ]),
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
          )
        ],
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: imgData.length,
        effect: ScrollingDotsEffect(
          dotHeight: 6,
          dotWidth: 6,
          activeDotColor: logoColor,
          dotColor: secondaryColor.withOpacity(0.3),
        ),
      );
}
