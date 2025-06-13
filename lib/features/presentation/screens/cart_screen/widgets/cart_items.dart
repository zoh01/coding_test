import 'package:delivery_app/features/data/provider/cart_provider.dart';
import 'package:delivery_app/features/domain/models/cart_model.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  final CartModel cartModel;

  const CartItems({super.key, required this.cartModel});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(ZohSizes.md),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ZohColors.darkGrey,
                offset: const Offset(2.0, 2.0),
                blurRadius: 3,
                spreadRadius: 1.0,
              ),
              BoxShadow(
                color: ZohColors.grey,
                offset: const Offset(-2.0, -2.0),
                blurRadius: 3,
                spreadRadius: 1.0,
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Image.asset(cartModel.productModel.image, width: 85, height: 85),
              SizedBox(width: ZohSizes.sm),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartModel.productModel.name,
                    style: GoogleFonts.oswald(
                      fontSize: ZohSizes.md,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: ZohSizes.xs),
                  Container(
                    decoration: BoxDecoration(
                      color: ZohColors.primaryColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(ZohSizes.sm),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: ZohSizes.sm,
                      vertical: ZohSizes.xs,
                    ),
                    child: Text("-${cartModel.productModel.discount}%"),
                  ),
                  SizedBox(height: ZohSizes.xs),
                  Text(
                    "\$${(cartModel.productModel.price.toStringAsFixed(2))}",
                    style: GoogleFonts.oswald(
                      fontSize: ZohSizes.spaceBtwZoh,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Positioned(
          top: 5,
          right: 5,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  /// Delete Button
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.trash, color: Colors.red),
                  ),
                  SizedBox(height: ZohSizes.sm),

                  /// Add & Remove Button
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (cartModel.quantity > 1) {
                              cartProvider.reduceQuantity(
                                cartModel.productModel,
                              );
                            }
                          },
                          icon: const Icon(
                            Iconsax.minus,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: ZohSizes.sm),
                        Text(
                          cartModel.quantity.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: ZohSizes.sm),
                        IconButton(
                          onPressed: () {
                            cartProvider.addCart(cartModel.productModel);
                          },
                          icon: const Icon(
                            Iconsax.add,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

      ],
    );
  }
}
