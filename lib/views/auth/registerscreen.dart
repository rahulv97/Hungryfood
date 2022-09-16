import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hungryfood/helpers/colorHelper.dart';
import 'package:hungryfood/helpers/textfieldhelper.dart';
import 'package:hungryfood/views/homepage.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();

  bool isPasswordVisible = true;

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          color: white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Image(
                  image: AssetImage("assets/logo.png"),
                  height: 80,
                ),
                const SizedBox(height: 20),
                Text(
                  "Let's get started",
                  style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: black,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formkey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fill your information",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 1,
                              color: secondaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: TextFormField(
                                controller: firstnameController,
                                decoration: InputDecoration(
                                  label: Text(
                                    'First Name',
                                    style: LabelStyle().lebel(context),
                                  ),
                                  helperStyle: TextStyle(color: hinttextColor),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  floatingLabelStyle: FloatingTextStyle()
                                      .floatingStyle(context),
                                  enabledBorder:
                                      MyCustomBorder().myCustomBorder(context),
                                  focusedBorder:
                                      MyCustomBorder().myCustomBorder(context),
                                  errorBorder: MyCustomErrorBorder()
                                      .myCustomErrorBorder(context),
                                  focusedErrorBorder: MyCustomFocusErrorBorder()
                                      .myCustomFocusErrorBorder(context),
                                ),
                                validator: (firstName) {
                                  if (firstName == null || firstName.isEmpty) {
                                    return 'Enter First name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: TextFormField(
                                controller: lastnameController,
                                decoration: InputDecoration(
                                  label: Text(
                                    'Last Name',
                                    style: LabelStyle().lebel(context),
                                  ),
                                  helperStyle: TextStyle(color: hinttextColor),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  floatingLabelStyle: FloatingTextStyle()
                                      .floatingStyle(context),
                                  enabledBorder:
                                      MyCustomBorder().myCustomBorder(context),
                                  focusedBorder:
                                      MyCustomBorder().myCustomBorder(context),
                                  errorBorder: MyCustomErrorBorder()
                                      .myCustomErrorBorder(context),
                                  focusedErrorBorder: MyCustomFocusErrorBorder()
                                      .myCustomFocusErrorBorder(context),
                                ),
                                validator: (lastName) {
                                  if (lastName == null || lastName.isEmpty) {
                                    return 'Enter First name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            label: Text(
                              "Enter email address",
                              style: LabelStyle().lebel(context),
                            ),
                            helperStyle: TextStyle(color: hinttextColor),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                          validator: (emailorphone) {
                            if (emailorphone == null || emailorphone.isEmpty) {
                              return 'Please enter email';
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]+.com")
                                .hasMatch(emailorphone)) {
                              return 'Please enter valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          obscureText: isPasswordVisible,
                          decoration: InputDecoration(
                            label: Text(
                              "Password",
                              style: LabelStyle().lebel(context),
                            ),
                            helperStyle: TextStyle(color: hinttextColor),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                            suffixIcon: IconButton(
                              onPressed: () => setState(
                                  () => isPasswordVisible = !isPasswordVisible),
                              icon: isPasswordVisible
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                          ),
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Please enter password';
                            }
                            if (!RegExp('(?=.*?[A-Z])').hasMatch(password)) {
                              return 'enter 1 capital letter';
                            }
                            if (!RegExp('(?=.*?[a-z])').hasMatch(password)) {
                              return 'enter small letter';
                            }
                            if (!RegExp('^(?=.*?[0-9])').hasMatch(password)) {
                              return 'enter 1 numeric digit';
                            }
                            if (!RegExp('^(?=.*?[!@#\$&*~])')
                                .hasMatch(password)) {
                              return 'special character also necessary';
                            }
                            if (!RegExp('^.{8,}').hasMatch(password)) {
                              return 'password length should be 8 character ';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: confirmpasswordController,
                          decoration: InputDecoration(
                            label: Text(
                              "Confirm Password",
                              style: LabelStyle().lebel(context),
                            ),
                            helperStyle: TextStyle(color: hinttextColor),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                          validator: (confirmPassword) {
                            if (confirmPassword == null ||
                                confirmPassword.isEmpty) {
                              return 'Please enter confirm password';
                            }
                            if (passwordController.text !=
                                confirmpasswordController.text) {
                              return "Password does not match";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        RichText(
                          text: TextSpan(
                            text: 'By clicking "Submit," you agree to ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                color: black,
                                fontSize: 12,
                                height: 1.5),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Karenderia General Terms and Conditions',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: secondaryColor,
                                  letterSpacing: 1,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: ' and acknowledge you have read the',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: black,
                                  letterSpacing: 1,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: ' Privacy Policy.',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: secondaryColor,
                                  letterSpacing: 1,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        CupertinoButton(
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width / 1.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: logoColor),
                              child: Center(
                                child: Text(
                                  "Submit",
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
                                Get.offAll(() => const HomePage());
                              }
                            }),
                        const SizedBox(height: 10),
                      ],
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
