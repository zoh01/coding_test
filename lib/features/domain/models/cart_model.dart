import 'package:delivery_app/features/domain/models/product_model.dart';

class CartModel {
  final ProductModel productModel;
  int quantity;

  CartModel({required this.productModel, required this.quantity});
}
