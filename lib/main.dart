import 'package:delivery_app/features/data/provider/cart_provider.dart';
import 'package:delivery_app/features/presentation/screens/splash_screen/splash_screen.dart';
import 'package:delivery_app/utils/helpers_function/helper_functions.dart';
import 'package:delivery_app/utils/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunctions.isDarkMode(context);
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (create) => CartProvider())],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coding Test',
        themeMode: ThemeMode.system,
        theme: ZohAppTheme.lightTheme,
        darkTheme: ZohAppTheme.darkTheme,
        home: Scaffold(backgroundColor: Colors.white, body: SplashScreen()),
      ),
    );
  }
}
