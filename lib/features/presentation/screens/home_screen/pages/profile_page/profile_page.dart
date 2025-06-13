import 'package:delivery_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ZohColors.primaryColor,
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
