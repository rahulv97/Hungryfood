import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungryfood/address.dart';
import 'package:hungryfood/helpers/colorHelper.dart';
import 'package:hungryfood/views/applycupon.dart';
import 'package:hungryfood/views/homepage.dart';

class ViewCartScreen extends StatefulWidget {
  const ViewCartScreen({Key? key}) : super(key: key);

  @override
  State<ViewCartScreen> createState() => _ViewCartScreenState();
}

class _ViewCartScreenState extends State<ViewCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: logoColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "View Cart",
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1,
            fontWeight: FontWeight.w500,
            color: white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "Resturant Name",
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                    color: black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Food Name",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
                  ),
                  Text(
                    "260 \$",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "half",
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  color: black,
                ),
              ),
              const SizedBox(height: 10),
              Divider(
                color: hinttextColor,
                thickness: 1,
              ),
              const SizedBox(height: 10),
              Text(
                "Offer and Discount",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  color: black,
                ),
              ),
              const SizedBox(height: 15),
              CupertinoButton(
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: textfielgbgColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      "Offer and Discount",
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                        color: white,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => const CuponScreen());
                  }),
              const SizedBox(height: 40),
              Text(
                "Bill details",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  color: black,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Item Total Price",
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1,
                            color: black,
                          ),
                        ),
                        Text(
                          '260 \$',
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1,
                            color: black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delievery Tax",
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1,
                            color: black,
                          ),
                        ),
                        Text(
                          '20 \$',
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1,
                            color: black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Gst Tax",
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1,
                            color: black,
                          ),
                        ),
                        Text(
                          '20 \$',
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1,
                            color: black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Paid",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            color: black,
                          ),
                        ),
                        Text(
                          '300 \$',
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1,
                            color: black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 105,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: logoColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 5),
                        child: Text(
                          'Delievery',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const AddressScreen());
                        },
                        child: SizedBox(
                          width: 260,
                          child: Text(
                            'Mumbai, India, Mumbai, India Mumbai Mumbai, IndiaMumbai, India',
                            style: TextStyle(
                              fontSize: 10,
                              letterSpacing: 1,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Get.offAll(() => const HomePage());
                    },
                    icon: const Icon(Icons.home_filled),
                    iconSize: 30,
                    color: white,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      '300 \$',
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1,
                        color: white,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      width: 100,
                      height: 20,
                      decoration: BoxDecoration(
                          color: white, borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'Proceed to Pay',
                          style: TextStyle(
                              fontSize: 12,
                              color: logoColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
