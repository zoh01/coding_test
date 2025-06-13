import 'package:delivery_app/features/data/provider/cart_provider.dart';
import 'package:delivery_app/features/domain/models/product_model.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductItems extends StatelessWidget {
  final ProductModel zohProductModel;
  const ProductItems({super.key, required this.zohProductModel});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      padding: EdgeInsets.all(ZohSizes.xs),
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
        borderRadius: BorderRadius.circular(ZohSizes.productImageRadius),
        color: ZohColors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 110,
            width: 150,
            padding: EdgeInsets.all(ZohSizes.sm),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: ZohSizes.sm,
                  child: Image.asset(
                    zohProductModel.image,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                /// Discount
                Positioned(
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ZohColors.primaryColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(ZohSizes.sm),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: ZohSizes.sm,
                      vertical: ZohSizes.xs,
                    ),
                    child: Text("-${zohProductModel.discount}%"),
                  ),
                ),
                /// Rating
                Positioned(
                  right: 0,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_rate_outlined,
                        color: ZohColors.primaryColor,
                      ),
                      Text(zohProductModel.rate.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          /// Name
          Text(
            zohProductModel.name,
            textAlign: TextAlign.center,
            style: GoogleFonts.oswald(
              fontWeight: FontWeight.bold,
              fontSize: ZohSizes.spaceBtwZoh,
            ),
          ),
          /// Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: ZohSizes.sm),
                child: Text(
                  "\$${(zohProductModel.price).toStringAsFixed(2)}",
                  style: GoogleFonts.oswald(fontWeight: FontWeight.bold, fontSize: ZohSizes.md),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: ZohSizes.spaceBtwZoh,),
              GestureDetector(
                onTap: () {
                  cartProvider.addCart(zohProductModel);
                },
                child: Container(
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(ZohSizes.cardRadiusMd),
                      bottomRight: Radius.circular(
                        ZohSizes.productImageRadius,
                      ),
                    ),
                  ),
                  child: const SizedBox(
                    width: ZohSizes.iconLg * 1.2,
                    height: ZohSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(Icons.shopping_cart_outlined, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
