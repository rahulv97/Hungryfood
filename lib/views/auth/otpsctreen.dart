import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:hungryfood/helpers/colorHelper.dart';
import 'package:hungryfood/helpers/textfieldhelper.dart';
import 'package:hungryfood/views/auth/registerscreen.dart';

class OtpScreen extends StatefulWidget {
  final String? phoneno;
  const OtpScreen({Key? key, required this.phoneno}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: white,
              child: Form(
                key: _formkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    const Image(
                      image: AssetImage("assets/logo.png"),
                      height: 100,
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: Text(
                        "Let's get started",
                        style: TextStyle(
                          fontSize: 24,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          color: black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enter the code sent to ${widget.phoneno}",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 1,
                                color: black.withOpacity(0.5),
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                label: Text(
                                  "Enter otp",
                                  style: LabelStyle().lebel(context),
                                ),
                                helperStyle: TextStyle(color: hinttextColor),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                floatingLabelStyle:
                                    FloatingTextStyle().floatingStyle(context),
                                enabledBorder:
                                    MyCustomBorder().myCustomBorder(context),
                                focusedBorder:
                                    MyCustomBorder().myCustomBorder(context),
                                errorBorder: MyCustomErrorBorder()
                                    .myCustomErrorBorder(context),
                                focusedErrorBorder: MyCustomFocusErrorBorder()
                                    .myCustomFocusErrorBorder(context),
                              ),
                              validator: (otp) {
                                if (otp == null || otp.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              }),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Resend Code",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: primaryColor,
                                  letterSpacing: 0.5,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: CupertinoButton(
                                child: Container(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: logoColor),
                                  child: Center(
                                    child: Text(
                                      "Next",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: white,
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    Get.to(() => const RegisterScreen());
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
