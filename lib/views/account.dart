import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungryfood/views/networks/api_constant.dart';
import 'package:hungryfood/helpers/colorHelper.dart';
import 'package:hungryfood/views/networks/http_request.dart';
import 'package:hungryfood/views/drawer/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onBoardingPages/onBoardingPage.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      drawer: const SideBarScreen(),
      appBar: AppBar(
        backgroundColor: logoColor,
        centerTitle: true,
        title: Text(
          "Account",
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1,
            fontWeight: FontWeight.w500,
            color: white,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: black.withOpacity(0.5),
                        blurRadius: 2,
                      )
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Arun Kumar",
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                color: black.withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "arunkumar@gmail.com",
                              style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 1,
                                color: black.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: white,
                            image: const DecorationImage(
                                image: AssetImage("assets/pizzahut.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: textfielgbgColor,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: black.withOpacity(0.5),
                        size: 35,
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: textfielgbgColor,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.bell,
                        color: black.withOpacity(0.5),
                        size: 35,
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: textfielgbgColor,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.payment,
                        color: black.withOpacity(0.5),
                        size: 35,
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: textfielgbgColor,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings,
                        color: black.withOpacity(0.5),
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: textfielgbgColor,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.cube_box,
                                  color: black.withOpacity(0.5),
                                  size: 20,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Your Orders",
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 1,
                                    color: black.withOpacity(0.5),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: black.withOpacity(0.5),
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.star,
                                  color: black.withOpacity(0.5),
                                  size: 20,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Your Rating",
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 1,
                                    color: black.withOpacity(0.5),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: black.withOpacity(0.5),
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.info,
                                  color: black.withOpacity(0.5),
                                  size: 20,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "About",
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 1,
                                    color: black.withOpacity(0.5),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: black.withOpacity(0.5),
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.square_pencil_fill,
                                  color: black.withOpacity(0.5),
                                  size: 20,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Send Feedback",
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 1,
                                    color: black.withOpacity(0.5),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: black.withOpacity(0.5),
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.star_lefthalf_fill,
                                  color: black.withOpacity(0.5),
                                  size: 20,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "App Rating",
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 1,
                                    color: black.withOpacity(0.5),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: black.withOpacity(0.5),
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setBool('showHome', false);
                              Get.offAll(() => const OnBoardingPage());
                            },
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.logout,
                                    color: black.withOpacity(0.5),
                                    size: 20,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Logout",
                                    style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 1,
                                      color: black.withOpacity(0.5),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setBool('showHome', false);
                              Get.offAll(() => const OnBoardingPage());
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: black.withOpacity(0.5),
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
