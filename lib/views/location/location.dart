import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungryfood/helpers/colorHelper.dart';
import 'package:hungryfood/helpers/custombottompage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../networks/api_constant.dart';
import '../networks/http_request.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List location = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: logoColor,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Location",
            style: TextStyle(
              fontSize: 18,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
              color: white,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: primaryColor, width: 1),
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        ApiRequest().postRequest(
                            ApiConstant().baseUrl, ApiConstant().location, {
                          'q': value,
                          'YII_CSRF_TOKEN':
                              'MVhvWmltTnRVY1FzTUVMb1RGQnBWcEdCTTYyazZGMGxIvxpxNjovK4-kr_5f_OGYzN8wZ2f8NtDlCmo9POieVw=='
                        }).then((value) {
                          setState(() {
                            Map<String, dynamic> map = json.decode(value);
                            location = map['details']['data'];
                          });
                        });
                      },
                      cursorColor: hinttextColor,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          CupertinoIcons.location_solid,
                          color: textfielgbgColor,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          color: black.withOpacity(0.5),
                          blurRadius: 5,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      itemCount: location.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () async {
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setString(
                                'Resturant_Location',
                                location[index]['addressLine1'] +
                                    ', ' +
                                    location[index]['addressLine2']);
                            prefs.setString(
                                'locationID', location[index]['id']);
                            Get.offAll(() => const CustomBottomBar());
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.location_solid,
                                  color: logoColor,
                                  size: 30,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      child: Text(
                                        location[index]['addressLine1'],
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      child: Text(
                                        location[index]['addressLine2'],
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: textfielgbgColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
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
