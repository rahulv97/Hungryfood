// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungryfood/helpers/colorHelper.dart';
import 'package:hungryfood/helpers/custombottompage.dart';
import 'package:hungryfood/views/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();
  bool isLastIndex = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
              ),
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() => isLastIndex = index == 2);
                },
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(
                          image: AssetImage("assets/food1.png"),
                          height: 250,
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text(
                            "Quality Food",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodtempor",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(
                          image: AssetImage("assets/food2.png"),
                          height: 250,
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text(
                            "Quality Food",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodtempor",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(
                          image: AssetImage("assets/food3.png"),
                          height: 250,
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text(
                            "Quality Food",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodtempor",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            width: MediaQuery.of(context).size.width,
            child: isLastIndex
                ? SizedBox(
                    height: 80,
                    child: Center(
                      child: TextButton(
                        onPressed: () async {
                          final pref = await SharedPreferences.getInstance();
                          pref.setBool('showHome', true);
                          Get.off(
                            () => const CustomBottomBar(),
                          );
                        },
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryColor,
                          ),
                          child: const Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => controller.jumpToPage(2),
                          child: const Text("Skip"),
                        ),
                        Center(
                          child: SmoothPageIndicator(
                            controller: controller,
                            count: 3,
                            effect: WormEffect(
                              dotColor: Colors.grey,
                              dotHeight: 8,
                              dotWidth: 8,
                              activeDotColor: primaryColor,
                            ),
                            onDotClicked: ((index) => controller.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn)),
                          ),
                        ),
                        TextButton(
                          onPressed: () => controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut),
                          child: const Text("Next"),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
