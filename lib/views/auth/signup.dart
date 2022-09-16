import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungryfood/helpers/colorHelper.dart';
import 'package:hungryfood/views/auth/login.dart';
import 'package:hungryfood/views/auth/otpsctreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;
  TextEditingController phoneController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formkey,
            child: Container(
              color: white,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enter your phone number",
                            style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 1,
                                color: black.withOpacity(0.5),
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width / 1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: black),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: phoneController,
                              validator: (phoneno) {
                                if (phoneno == null || phoneno.isEmpty) {
                                  return 'Enter phone no';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            final code = await countryPicker
                                                .showPicker(context: context);
                                            setState(() {
                                              countryCode = code;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                child: countryCode != null
                                                    ? countryCode!.flagImage
                                                    : countryCode?.flagImage,
                                              ),
                                              const SizedBox(width: 10),
                                              Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15,
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: secondaryColor
                                                          .withOpacity(0.4)),
                                                  child: Text(
                                                    countryCode?.dialCode ??
                                                        "+91",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        letterSpacing: 1,
                                                        color: white),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        ],
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
                              Get.to(() => OtpScreen(
                                    phoneno: phoneController.text,
                                  ));
                            }
                          }),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Have an account? ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: black,
                            fontSize: 16,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Sign In',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: secondaryColor,
                                  letterSpacing: 1,
                                  fontSize: 16,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.offAll(() => const LoginScreen());
                                  }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
