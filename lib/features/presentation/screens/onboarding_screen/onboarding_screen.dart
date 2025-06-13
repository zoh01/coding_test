import 'package:animate_do/animate_do.dart';
import 'package:delivery_app/features/presentation/screens/onboarding_screen/widgets/onboarding_page.dart';
import 'package:delivery_app/features/presentation/screens/welcome_screen/welcome_screen.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/image_strings.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/constants/text_strings.dart';
import 'package:delivery_app/utils/device_utils/device_utilities.dart';
import 'package:delivery_app/utils/helpers_function/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Stack(
        children: [
          /// PageView
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            children: [
              OnBoardingPage(
                image: ZohImagesString.onBoarding1,
                title: ZohTextString.onBoardingTitle1,
                subTitle: ZohTextString.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: ZohImagesString.onBoarding2,
                title: ZohTextString.onBoardingTitle2,
                subTitle: ZohTextString.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: ZohImagesString.onBoarding3,
                title: ZohTextString.onBoardingTitle3,
                subTitle: ZohTextString.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Dots Indicator
          Positioned(
            left: ZohSizes.defaultSpace,
            bottom: ZohDeviceUtils.getAppBarHeight() * 2.2,
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: WormEffect(
                spacing: 5,
                activeDotColor: ZohColors.primaryColor,
                dotColor: ZohColors.secondaryColor,
                dotWidth: 25,
                dotHeight: 7,
              ),
              onDotClicked: (index) {
                controller.animateToPage(
                  index,
                  duration: Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),

          Positioned(
            right: ZohSizes.defaultSpace,
            top: ZohSizes.sm,
            child: FadeInUp(
              duration: Duration(milliseconds: 2000),
              animate: true,
              child: OutlinedButton(
                onPressed: () {
                  controller.jumpToPage(2);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: BorderSide(color: Colors.transparent),
                  overlayColor: ZohColors.secondaryColor,
                  elevation: 3,
                  padding: EdgeInsets.symmetric(
                    horizontal: ZohSizes.md,
                    vertical: ZohSizes.sm,
                  ),
                ),
                child: Text(
                  'Skip',
                  style: TextStyle(color: ZohColors.primaryColor),
                ),
              ),
            ),
          ),

          isLastPage
              ? Positioned(
                left: ZohSizes.defaultSpace,
                right: ZohSizes.defaultSpace,
                bottom: ZohDeviceUtils.getAppBarHeight() * 1.2,
                child: SizedBox(
                  width: double.infinity,
                  child: FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WelcomeScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: ZohColors.secondaryColor,
                        side: BorderSide(color: ZohColors.secondaryColor),
                      ),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.ubuntu(
                          fontSize: ZohSizes.spaceBtwZoh,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              : Stack(
                children: [
                  Positioned(
                    left: ZohSizes.defaultSpace,
                    bottom: ZohDeviceUtils.getAppBarHeight() * 1.2,
                    child: FadeInUp(
                      duration: Duration(milliseconds: 2000),
                      animate: true,
                      child: OutlinedButton(
                        onPressed: () {
                          controller.initialPage;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: BorderSide(color: Colors.transparent),
                          overlayColor: ZohColors.secondaryColor,
                          elevation: 3,
                          padding: EdgeInsets.symmetric(
                            horizontal: ZohSizes.md,
                            vertical: ZohSizes.sm,
                          ),
                        ),
                        child: Text(
                          'Back',
                          style: TextStyle(color: ZohColors.primaryColor),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: ZohSizes.defaultSpace,
                    bottom: ZohDeviceUtils.getAppBarHeight() * 1.2,
                    child: FadeInUp(
                      duration: Duration(milliseconds: 2000),
                      animate: true,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.nextPage(
                            duration: Duration(milliseconds: 700),
                            curve: Curves.easeInOut,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ZohColors.secondaryColor,
                          overlayColor: ZohColors.secondaryColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: ZohSizes.md,
                            vertical: ZohSizes.sm,
                          ),
                          elevation: 3,
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(color: ZohColors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        ],
      ),
    );
  }
}
