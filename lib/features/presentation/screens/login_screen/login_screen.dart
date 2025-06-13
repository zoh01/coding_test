import 'package:animate_do/animate_do.dart';
import 'package:delivery_app/features/presentation/screens/home_screen/home_screen.dart';
import 'package:delivery_app/features/presentation/screens/login_screen/widgets/login_form.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/helpers_function/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/constants/colors.dart';
import '../signup_screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
                'Hello Again!',
                style: GoogleFonts.bungee(fontSize: ZohSizes.spaceBtwZoh),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ZohSizes.sm),
              Text(
                "Welcome back, you've been missed!",
                style: GoogleFonts.arimo(
                  fontSize: ZohSizes.spaceBtwItems,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: ZohSizes.defaultSpace),

              LoginForm(),

              SizedBox(height: ZohSizes.spaceBtwItems),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: BorderSide(color: Colors.transparent),
                    overlayColor: ZohColors.primaryColor,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Create Account',
                    style: GoogleFonts.arimo(
                      color: ZohColors.primaryColor,
                      fontSize: ZohSizes.spaceBtwZoh,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
