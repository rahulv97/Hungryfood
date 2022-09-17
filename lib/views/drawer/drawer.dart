import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungryfood/helpers/colorHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../onBoardingPages/onBoardingPage.dart';

class SideBarScreen extends StatefulWidget {
  const SideBarScreen({Key? key}) : super(key: key);

  @override
  State<SideBarScreen> createState() => _SideBarScreenState();
}

class _SideBarScreenState extends State<SideBarScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: MediaQuery.of(context).size.width / 1.5,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Center(
                child: Image(
                  image: AssetImage("assets/logo.png"),
                  height: 80,
                ),
              ),
              Divider(
                color: textfielgbgColor,
                thickness: 1,
              ),
              const SizedBox(height: 30),
              Text(
                "Manneged by Account",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  color: black.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "My Order",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  color: black.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Address",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  color: black.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Saved Stores",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  color: black.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', false);
                  Get.offAll(() => const OnBoardingPage());
                },
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: black.withOpacity(0.5),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                "Lieferlein.de",
                style: TextStyle(
                  fontSize: 26,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  color: logoColor,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
