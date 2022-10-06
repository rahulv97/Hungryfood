import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:hungryfood/helpers/colorHelper.dart';
import 'package:hungryfood/views/address/addnewaddress.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
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
          "Address",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add a new Address",
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                    color: black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.off(() => const AddNewAddress());
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
            Divider(
              color: hinttextColor,
              thickness: 1,
            ),
            const SizedBox(height: 20),
            Text(
              "Address",
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
                color: black,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: hinttextColor,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Arun Kumar",
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Address - Lorem Ipsum is not simply random text. It has roots in a piece.",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                      color: black.withOpacity(0.4),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "pin Code",
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          color: black.withOpacity(0.4),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "141414",
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          color: black.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Phone",
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          color: black.withOpacity(0.4),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "45451245",
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          color: black.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      CupertinoButton(
                        onPressed: () {},
                        child: Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: hinttextColor,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                fontSize: 12,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                                color: black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: hinttextColor,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Remove",
                            style: TextStyle(
                              fontSize: 12,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500,
                              color: black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
