import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers_function/helper_functions.dart';
import '../../login_screen/login_screen.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late bool _isSecured = true;
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunctions.isDarkMode(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: firstNameController,
                  validator: (zoh) {
                    if (zoh!.isEmpty) {
                      return 'First Name Required';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.black,
                  expands: false,
                  style: GoogleFonts.saira(
                    color: Colors.black,
                    fontSize: ZohSizes.md,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.person, color: Colors.black),
                    fillColor: Colors.white,
                    hintText: 'First Name',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: ZohSizes.sm),
              Expanded(
                child: TextFormField(
                  controller: lastNameController,
                  validator: (zoh) {
                    if (zoh!.isEmpty) {
                      return 'Last Name required';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.black,
                  expands: false,
                  style: GoogleFonts.saira(
                    color: Colors.black,
                    fontSize: ZohSizes.md,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.person, color: Colors.black),
                    fillColor: Colors.white,
                    hintText: 'Last Name',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: ZohSizes.md),
          TextFormField(
            controller: userNameController,
            validator: (zoh) {
              if (zoh!.isEmpty) {
                return 'Username Required';
              }
              return null;
            },
            cursorColor: Colors.black,
            keyboardType: TextInputType.name,
            style: GoogleFonts.saira(
              color: Colors.black,
              fontSize: ZohSizes.md,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              filled: true,
              prefixIcon: Icon(Iconsax.user_edit, color: Colors.black),
              fillColor: Colors.white,
              hintText: 'Username',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              ),
            ),
          ),
          SizedBox(height: ZohSizes.md),
          TextFormField(
            controller: emailController,
            validator: (zoh) {
              if (zoh!.isEmpty) {
                return 'Email Address Required';
              } else if (!emailRegex.hasMatch(zoh)) {
                return 'Invalid Email Address';
              }
              return null;
            },
            cursorColor: Colors.black,
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.saira(
              color: Colors.black,
              fontSize: ZohSizes.md,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              filled: true,
              prefixIcon: Icon(Icons.email, color: Colors.black),
              fillColor: Colors.white,
              hintText: 'Email Address',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              ),
            ),
          ),
          SizedBox(height: ZohSizes.md),
          TextFormField(
            controller: phoneNumberController,
            validator: (zoh) {
              if (zoh!.isEmpty) {
                return 'Phone Number Required';
              }
              return null;
            },
            cursorColor: Colors.black,
            keyboardType: TextInputType.phone,
            style: GoogleFonts.saira(
              color: Colors.black,
              fontSize: ZohSizes.md,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              filled: true,
              prefixIcon: Icon(Icons.phone, color: Colors.black),
              fillColor: Colors.white,
              hintText: 'Phone Number',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              ),
            ),
          ),
          SizedBox(height: ZohSizes.md),
          TextFormField(
            controller: passwordController,
            validator: (zoh) {
              if (zoh!.isEmpty) {
                return 'Password Required';
              }
              return null;
            },
            keyboardType: TextInputType.visiblePassword,
            style: GoogleFonts.saira(
              color: Colors.black,
              fontSize: ZohSizes.md,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              filled: true,
              prefixIcon: Icon(
                Icons.password,
                color: dark ? Colors.white : Colors.black,
              ),
              fillColor: Colors.white54,
              hintText: 'Enter Password',
              suffixIcon: toggleZoh(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: dark ? Colors.white : Colors.black,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              ),
            ),
            cursorColor: Colors.black,
            obscureText: _isSecured,
          ),
          SizedBox(height: ZohSizes.defaultSpace),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }
                return;
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
                'Create Account',
                style: GoogleFonts.arimo(
                  fontSize: ZohSizes.spaceBtwZoh,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget toggleZoh() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecured = !_isSecured;
        });
      },
      icon:
      _isSecured
          ? Icon(
        Icons.visibility_off,
        color:
        ZohHelperFunctions.isDarkMode(context)
            ? Colors.white
            : Colors.black,
      )
          : Icon(
        Icons.visibility,
        color:
        ZohHelperFunctions.isDarkMode(context)
            ? Colors.white
            : Colors.black,
      ),
    );
  }

  final emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,})$',
  );
}