import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungryfood/helpers/colorHelper.dart';
import 'package:hungryfood/views/addcreditcard.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
          "Payment",
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment Options",
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  color: black,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "item Prices",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      color: black.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "260 \$",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      color: black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Divider(
                color: textfielgbgColor,
                thickness: 1,
              ),
              const SizedBox(height: 20),
              Text(
                "Credit or Debit",
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  color: black,
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Get.to(() => const AddNewCardScreen());
                },
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: logoColor,
                      ),
                      child: Icon(
                        Icons.add,
                        color: white,
                        size: 25,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Add new card",
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        color: black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Divider(
                color: textfielgbgColor,
                thickness: 1,
              ),
              const SizedBox(height: 20),
              Text(
                "More Payment Method",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: black,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage("assets/wallet.png"),
                      height: 20,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "Wallet",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage("assets/netBanking.png"),
                      height: 20,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "Net Banking",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage("assets/cash.png"),
                      height: 20,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "Cash on Delievery",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Instruction",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: black.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature.",
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                          color: black.withOpacity(0.6),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
