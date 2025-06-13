import 'package:animate_do/animate_do.dart';
import 'package:delivery_app/features/presentation/screens/login_screen/login_screen.dart';
import 'package:delivery_app/features/presentation/screens/signup_screen/widgets/signup_form.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/helpers_function/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        leading: FadeInLeft(
          duration: Duration(milliseconds: 2000),
          animate: true,
          child: IconButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              overlayColor: ZohColors.secondaryColor,
            ),
            onPressed: () => Get.back(),
            icon: Padding(
              padding: const EdgeInsets.only(left: ZohSizes.sm),
              child: Icon(Icons.arrow_back_ios, size: ZohSizes.defaultSpace),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZohSizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Let's Create Your Account",
                style: GoogleFonts.bungee(fontSize: ZohSizes.spaceBtwZoh),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ZohSizes.defaultSpace),

              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}

