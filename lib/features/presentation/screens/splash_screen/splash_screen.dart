import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:delivery_app/features/presentation/screens/onboarding_screen/onboarding_screen.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/image_strings.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/constants/text_strings.dart';
import 'package:delivery_app/utils/helpers_function/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 8)).then((zoh) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx) => OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDown(
              duration: Duration(milliseconds: 3000),
              animate: true,
              child: Image(
                image: AssetImage(ZohImagesString.splash),
                height: ZohHelperFunctions.screenHeight() * .4,
              ),
            ),
            SizedBox(
              child: FadeInUp(
                duration: Duration(milliseconds: 3000),
                animate: true,
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: ZohColors.primaryColor,
                    fontFamily: 'Roboto',
                    fontSize: ZohSizes.spaceBtwItems,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        ZohTextString.splashTitle,
                        speed: Durations.short1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
