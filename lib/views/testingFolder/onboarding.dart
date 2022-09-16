import 'package:flutter/material.dart';
import 'package:hungryfood/controllers/onboarding_Controllers.dart';
import 'package:hungryfood/helpers/colorHelper.dart';

class OnboardingPageScreen extends StatefulWidget {
  const OnboardingPageScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingPageScreen> createState() => _OnboardingPageScreenState();
}

class _OnboardingPageScreenState extends State<OnboardingPageScreen> {
  final controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SafeArea(
              child: PageView.builder(itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        controller.onboardingPages[index].image,
                        height: 250,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          controller.onboardingPages[index].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: Flexible(
                            child: Text(
                          controller.onboardingPages[index].discription,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.justify,
                        )),
                      ),
                    ],
                  ),
                );
              }),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: List.generate(
                    controller.onboardingPages.length,
                    (index) => Container(
                          margin: const EdgeInsets.all(4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
