import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers_function/helper_functions.dart';
import '../../home_screen/home_screen.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isSecuredZoh = true;
  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunctions.isDarkMode(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
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
              hintText: 'Enter Email',
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
            obscureText: _isSecuredZoh,
          ),
          SizedBox(height: ZohSizes.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    activeColor: ZohColors.primaryColor,
                    checkColor: ZohColors.secondaryColor,
                    hoverColor: ZohColors.grey,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                  ),
                  Text('Remember Me!'),
                ],
              ),
              OutlinedButton(
                onPressed: () {},
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
                  'Forgot Password',
                  style: GoogleFonts.arimo(
                    fontSize: ZohSizes.iconXs,
                    color: ZohColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: ZohSizes.defaultSpace),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                }
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
          _isSecuredZoh = !_isSecuredZoh;
        });
      },
      icon:
      _isSecuredZoh
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