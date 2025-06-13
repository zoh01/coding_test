import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers_function/helper_functions.dart';


class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    required this.image,
    required this.title,
    required this.subTitle,
    super.key,
  });

  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          left: 0,
          top: 70,
          child: FadeInRight(
            duration: Duration(milliseconds: 2000),
            animate: true,
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.contain,
              height: ZohHelperFunctions.screenHeight() * .45,
            ),
          ),
        ),
        Positioned(
          top: ZohHelperFunctions.screenHeight() / 1.7,
          left: 0,
          right: 0,
          child: FadeInRight(
            duration: Duration(milliseconds: 2000),
            animate: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: ZohSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.anton(
                      color: Colors.black,
                      fontSize: ZohSizes.md,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: ZohSizes.spaceBtwItems),
                  Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.bebasNeue(
                      color: Colors.black,
                      fontSize: ZohSizes.md,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}