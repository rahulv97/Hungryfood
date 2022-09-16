import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungryfood/helpers/colorHelper.dart';
import 'package:hungryfood/helpers/custombottompage.dart';
import 'package:hungryfood/helpers/textfieldhelper.dart';
import 'package:hungryfood/views/auth/signup.dart';
import 'package:hungryfood/views/homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRember = false;
  bool isPasswordVisible = true;

  final _formkey = GlobalKey<FormState>();

  TextEditingController mobEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            color: white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/logo.png"),
                    height: 80,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 26,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      color: black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: mobEmailController,
                    decoration: InputDecoration(
                      label: Text(
                        "Mobile number or email",
                        style: LabelStyle().lebel(context),
                      ),
                      helperStyle: TextStyle(color: hinttextColor),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      floatingLabelStyle:
                          FloatingTextStyle().floatingStyle(context),
                      enabledBorder: MyCustomBorder().myCustomBorder(context),
                      focusedBorder: MyCustomBorder().myCustomBorder(context),
                      errorBorder:
                          MyCustomErrorBorder().myCustomErrorBorder(context),
                      focusedErrorBorder: MyCustomFocusErrorBorder()
                          .myCustomFocusErrorBorder(context),
                    ),
                    validator: (emailorphone) {
                      if (emailorphone == null || emailorphone.isEmpty) {
                        return 'Please enter email or phone';
                      }
                      // if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]+.com")
                      //     .hasMatch(emailorphone)) {
                      //   return 'Please enter valid email';
                      // }
                      // if (emailorphone == ) {

                      // }
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
                      border: InputBorder.none,
                      helperStyle: TextStyle(color: hinttextColor),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      floatingLabelStyle:
                          FloatingTextStyle().floatingStyle(context),
                      enabledBorder: MyCustomBorder().myCustomBorder(context),
                      focusedBorder: MyCustomBorder().myCustomBorder(context),
                      errorBorder:
                          MyCustomErrorBorder().myCustomErrorBorder(context),
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
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            value: isRember,
                            onChanged: (value) {
                              setState(() => isRember = value!);
                            },
                            activeColor: primaryColor,
                          ),
                          const Text(
                            "Remember me",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
                              letterSpacing: 0.5,
                              decoration: TextDecoration.underline,
                              decorationThickness: 2),
                        ),
                      ),
                    ],
                  ),
                  CupertinoButton(
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 1.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: logoColor),
                        child: Center(
                          child: Text(
                            "Sign In",
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
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(content: Text('Show the error')));
                          Get.offAll(() => const CustomBottomBar());
                        }
                      }),
                  const SizedBox(height: 10),
                  Text(
                    "Dont't have an account?",
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1,
                        color: black.withOpacity(0.7),
                        fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const SignUpScreen());
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: black)),
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    child: Row(
                      children: [
                        const Image(
                          image: AssetImage("assets/fb.png"),
                          height: 40,
                        ),
                        const SizedBox(width: 50),
                        Text(
                          "Login with facebook",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: black.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: black),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    child: Row(
                      children: [
                        const Image(
                          image: AssetImage("assets/google.png"),
                          height: 40,
                        ),
                        const SizedBox(width: 50),
                        Text(
                          "Login with Google",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: black.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
