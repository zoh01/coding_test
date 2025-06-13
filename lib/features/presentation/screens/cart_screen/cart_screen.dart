import 'package:animate_do/animate_do.dart';
import 'package:delivery_app/features/data/provider/cart_provider.dart';
import 'package:delivery_app/features/domain/models/cart_model.dart';
import 'package:delivery_app/features/presentation/screens/cart_screen/widgets/cart_items.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/device_utils/device_utilities.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../data/appbar/appbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    List<CartModel> cartItems = cartProvider.carts.reversed.toList();
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      /// App Bar
      appBar: ZohAppBar(title: Text('My Cart'), showBackArrow: true),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(ZohSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...List.generate(
                cartItems.length,
                (index) => Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Stack(
                    children: [
                      FadeInUp(
                        duration: Duration(milliseconds: (index + 1) * 200),
                        child: CartItems(cartModel: cartItems[index]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: ZohDeviceUtils.getBottomNavigationBarHeight() * 3,
        width: double.infinity,
        padding: EdgeInsets.all(ZohSizes.defaultSpace),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(ZohSizes.spaceBtwZoh),
            topRight: Radius.circular(ZohSizes.spaceBtwZoh),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Delivery Fee',
                  style: GoogleFonts.robotoCondensed(
                    fontWeight: FontWeight.bold,
                    fontSize: ZohSizes.md,
                  ),
                ),
                SizedBox(width: ZohSizes.md),
                Expanded(
                  child: DottedLine(
                    dashLength: 10,
                    dashColor: ZohColors.primaryOpacity,
                  ),
                ),
                SizedBox(width: ZohSizes.md),
                Text(
                  "\$${3.52}",
                  style: GoogleFonts.robotoCondensed(
                    fontWeight: FontWeight.bold,
                    fontSize: ZohSizes.md,
                  ),
                ),
              ],
            ),
            SizedBox(height: ZohSizes.sm),
            Row(
              children: [
                Text(
                  'Order Amount',
                  style: GoogleFonts.robotoCondensed(
                    fontWeight: FontWeight.bold,
                    fontSize: ZohSizes.md,
                  ),
                ),
                SizedBox(width: ZohSizes.md),
                Expanded(
                  child: DottedLine(
                    dashLength: 10,
                    dashColor: ZohColors.primaryOpacity,
                  ),
                ),
                SizedBox(width: ZohSizes.md),
                Text(
                  "\$${(cartProvider.totalCart().toStringAsFixed(2))}",
                  style: GoogleFonts.robotoCondensed(
                    fontWeight: FontWeight.bold,
                    fontSize: ZohSizes.md,
                  ),
                ),
              ],
            ),
            SizedBox(height: ZohSizes.spaceBtwZoh),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: ZohColors.primaryColor,
                  side: BorderSide(color: ZohColors.primaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textStyle: GoogleFonts.arimo(fontSize: ZohSizes.md),
                ),
                child: Text(
                  "Checkout \$${(cartProvider.totalCart() + 3.52).toStringAsFixed(2)}",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
