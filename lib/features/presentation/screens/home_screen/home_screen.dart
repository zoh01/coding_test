import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:delivery_app/features/presentation/screens/home_screen/pages/cart_page/cart_page.dart';
import 'package:delivery_app/features/presentation/screens/home_screen/pages/explore_page/explore_page.dart';
import 'package:delivery_app/features/presentation/screens/home_screen/pages/home_page/home_page.dart';
import 'package:delivery_app/features/presentation/screens/home_screen/pages/profile_page/profile_page.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/image_strings.dart';
import 'package:delivery_app/utils/helpers_function/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  late var index = 0;

  final items = <Widget>[
    Icon(Icons.home),
    Icon(Icons.shopping_cart),
    Icon(Icons.explore),
    Icon(CupertinoIcons.profile_circled),
  ];

  final screens = [
    HomePage(),
    CartPage(),
    ExplorePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunctions.isDarkMode(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: ZohColors.primaryColor,
        body: screens[index],
        bottomNavigationBar: Theme(
          data: ThemeData.dark(),
          child: CurvedNavigationBar(
            color: ZohColors.primaryOpacity,
            key: navigationKey,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 500),
            backgroundColor: Colors.transparent,
            height: 60,
            items: items,
            index: index,
            onTap: (index) => setState(() {
              this.index = index;
            }),
          ),
        ),
      ),
    );
  }
}
