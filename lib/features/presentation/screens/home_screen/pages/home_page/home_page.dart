import 'package:animate_do/animate_do.dart';
import 'package:delivery_app/features/domain/models/category_models.dart';
import 'package:delivery_app/features/domain/models/product_model.dart';
import 'package:delivery_app/features/presentation/screens/cart_screen/cart_screen.dart';
import 'package:delivery_app/features/presentation/screens/home_screen/pages/home_page/widgets/product_items.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../data/provider/cart_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  String category = '';

  /// Category
  List<CategoryModel> categoryModel = [
    CategoryModel(ZohImagesString.clothing, 'Clothing'),
    CategoryModel(ZohImagesString.kitchen, 'Kitchen'),
    CategoryModel(ZohImagesString.beauty, 'Beauty'),
    CategoryModel(ZohImagesString.fastFood, 'Fast Food'),
  ];

  /// Products
  List<ProductModel> productModel = [
    ProductModel(ZohImagesString.sweeter, 'Sweeter', 'Clothing', 12.5, 4.7, 12),
    ProductModel(ZohImagesString.shirt, 'Shirt', 'Clothing', 10.7, 4.8, 15),
    ProductModel(ZohImagesString.jeans, 'Jeans', 'Clothing', 5.2, 4.5, 10),
    ProductModel(
      ZohImagesString.kettle,
      'Electric Kettle',
      'Kitchen',
      22.3,
      4.9,
      5,
    ),
    ProductModel(ZohImagesString.blender, 'Blender', 'Kitchen', 25.3, 4.8, 7),
    ProductModel(ZohImagesString.pot, 'Pot Set', 'Kitchen', 30.6, 4.6, 9),
    ProductModel(ZohImagesString.sandWitch, 'SandWitch', 'Fast Food', 5.2, 5.0, 50),
    ProductModel(ZohImagesString.burger, 'Burger', 'Fast Food', 8.5, 5.0, 40),
    ProductModel(ZohImagesString.frenchFries, 'French Fries', 'Fast Food', 4.2, 5.0, 25),
    ProductModel(ZohImagesString.makeup, 'Make Up', 'Beauty', 24.6, 4.8, 18),
    ProductModel(ZohImagesString.perfume, 'Perfume', 'Beauty', 38.6, 4.9, 27),
    ProductModel(ZohImagesString.sunscreen, 'Face Cream', 'Beauty', 15.6, 4.8, 32),
  ];

  List<ProductModel> myProductModel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Set the initial category for the first item in myCategories and initially display
    if (categoryModel.isNotEmpty) {
      category = categoryModel[0].title;
      filterProductByCategory(category);
    }
  }

  void filterProductByCategory(String selectedCategory) {
    setState(() {
      category = selectedCategory;
      myProductModel =
          productModel
              .where(
                (element) =>
                    element.category.toLowerCase() ==
                    selectedCategory.toLowerCase(),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.only(top: ZohSizes.sm, left: ZohSizes.md, right: ZohSizes.md),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeInLeft(
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: ZohColors.primaryColor,
                      ),
                      SizedBox(width: ZohSizes.xs),
                      Text(
                        'New York, USA',
                        style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                FadeInRight(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(ZohSizes.xs),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(ZohSizes.sm),
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.black54,
                          size: ZohSizes.spaceBtwZoh,
                        ),
                      ),
                      SizedBox(width: ZohSizes.sm),
                      Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CartScreen(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(ZohSizes.xs),
                              margin: EdgeInsets.symmetric(vertical: 15),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(ZohSizes.sm),
                              ),
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.black54,
                                size: ZohSizes.spaceBtwZoh,
                              ),
                            ),
                          ),
                          cartProvider.carts.isNotEmpty
                              ? Positioned(
                                right: 0,
                                top: 0,
                                child: GestureDetector(
                                  child: Container(
                                    padding: EdgeInsets.all(ZohSizes.sm),
                                    decoration: BoxDecoration(
                                      color: ZohColors.primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      cartProvider.carts.length.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ZohSizes.iconXs,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            FadeInLeft(
              duration: Duration(milliseconds: 1000),
              child: Text(
                "Get your favorite product here with ease...",
                style: GoogleFonts.roboto(
                  fontSize: ZohSizes.spaceBtwZoh,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -.4,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeInLeft(
                  child: Text(
                    'Find by category',
                    style: GoogleFonts.ptSans(
                      fontSize: ZohSizes.md,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FadeInRight(
                  child: TextButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      overlayColor: ZohColors.primaryColor,
                    ),
                    child: Text(
                      'See all',
                      style: TextStyle(color: ZohColors.primaryColor),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  categoryModel.length,
                  (index) => GestureDetector(
                    onTap: () {
                      filterProductByCategory(categoryModel[index].title);
                    },
                    child: FadeInUp(
                      duration: Duration(milliseconds: 2000),
                      child: Container(
                        width: 70,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              category == categoryModel[index].title
                                  ? Border.all(
                                    color: ZohColors.primaryColor,
                                    width: 2.5,
                                  )
                                  : Border.all(color: Colors.white),
                        ),
                        child: FadeIn(
                          duration: Duration(milliseconds: 2000),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 10,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black45,
                                          blurRadius: ZohSizes.sm,
                                          spreadRadius: ZohSizes.xs,
                                          offset: Offset(0, 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image(
                                    image: AssetImage(categoryModel[index].image),
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                              SizedBox(height: ZohSizes.sm),
                              Text(categoryModel[index].title),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: ZohSizes.md),

            FadeInUp(duration: Duration(milliseconds: 2200),child: Text("Result (${myProductModel.length})")),

            SizedBox(height: ZohSizes.spaceBtwZoh),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: FadeInUp(
                duration: Duration(milliseconds: 2500),
                child: Row(
                  children: [
                    ...List.generate(
                      myProductModel.length,
                      (index) => Padding(
                        padding:
                            index == 0
                                ? const EdgeInsets.only(
                                  left: ZohSizes.spaceBtwZoh,
                                  right: ZohSizes.spaceBtwZoh,
                                )
                                : const EdgeInsets.only(
                                  right: ZohSizes.spaceBtwZoh,
                                ),
                        child: ProductItems(
                          zohProductModel: myProductModel[index],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
