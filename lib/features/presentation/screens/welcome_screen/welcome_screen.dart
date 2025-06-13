import 'package:animate_do/animate_do.dart';
import 'package:delivery_app/features/presentation/screens/login_screen/login_screen.dart';
import 'package:delivery_app/features/presentation/screens/signup_screen/signup_screen.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(ZohSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FadeInDown(
              duration: Duration(milliseconds: 2000),
              animate: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome To E-Commerce',
                    style: GoogleFonts.bungee(fontSize: ZohSizes.spaceBtwZoh),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Please login to your account or create new account to continue',
                    style: GoogleFonts.arimo(
                      fontSize: ZohSizes.spaceBtwItems,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            FadeInUp(
              duration: Duration(milliseconds: 2000),
              animate: true,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: ZohSizes.spaceBtwSections * 1.5,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: ZohColors.secondaryColor,
                        side: BorderSide(color: ZohColors.secondaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: GoogleFonts.ubuntu(
                          fontSize: ZohSizes.spaceBtwZoh,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: ZohSizes.spaceBtwItems),
                  SizedBox(
                    width: double.infinity,
                    height: ZohSizes.spaceBtwSections * 1.5,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
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
                        style: GoogleFonts.ubuntu(
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
          ],
        ),
      ),
    );
  }
}
