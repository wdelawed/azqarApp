import 'package:azkar/config/global_dart.dart';
import 'package:azkar/onboarding_module/ui/on_boarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    jump();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/img_splash_background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 100,
              height: 141,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/icons/ic_azkar_splash.png"),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 65),
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              // alignment: Alignment.bottomCenter,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Powered by AZQAR",
                    style: primaryTextStyle,
                  ),
                  Text(
                    "2021 - 2022",
                    style: secondaryTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void jump() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const OnBoardingScreen(),
      ),
    );
  }
}
