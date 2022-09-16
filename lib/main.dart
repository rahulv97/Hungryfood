import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hungryfood/views/auth/login.dart';
import 'package:hungryfood/views/onBoardingPages/onBoardingPage.dart';
import 'package:hungryfood/views/resturantfooddetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(MyApp(
    showHome: showHome,
  ));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({
    Key? key,
    required this.showHome,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: showHome ? const LoginScreen() : const OnBoardingPage(),

      // home: const RestutrantFoodListScreen(),
    );
  }
}


//  actions: [
            // IconButton(
            //     onPressed: () async {
            //       final prefs = await SharedPreferences.getInstance();
            //       prefs.setBool('showHome', false);
            //       Get.offAll(() => const OnBoardingPage());
            //     },
            //     icon: const Icon(Icons.logout))
//           ],