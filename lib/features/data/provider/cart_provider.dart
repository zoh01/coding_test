import 'package:delivery_app/features/domain/models/cart_model.dart';
import 'package:delivery_app/features/domain/models/product_model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  // private list _carts to store cart items, each represented by a cartModel
  List<CartModel> _carts = [];
  // getter for _Carts to access the list of cart items
  List<CartModel> get carts => _carts;
  // setter for _carts. updates the cart list and notifies listeners when it changes.
  set carts(List<CartModel> carts){
    _carts = carts;
    notifyListeners(); // Notifies any widget listening to this provider to rebuild.
  }
  //  adds a product to the cart.
  addCart(ProductModel productModel) {
    if (productExist(productModel)){
      // find the index of the product in the cart
      int index = _carts.indexWhere((element) => element.productModel == productModel);
      // increments the quantity of the product by 1 if it already exists.
      _carts[index].quantity = _carts[index].quantity + 1;
    } else {
      // add a new CartModel item with quantity 1 if the product doesn't exist in the cart
      _carts.add(CartModel(productModel: productModel, quantity: 1));
    }
    notifyListeners(); // update
  }
  //increase the quantity of a specific product in the cart by 1,
  addQuantity(ProductModel product) {
    // finds the index of the product in the cart.
    int index = _carts.indexWhere((element) => element.productModel == product);
    // increments the quantity by 1.
    _carts[index].quantity = _carts[index].quantity + 1;
    notifyListeners(); // Update the quantity change
  }
  // Decreases the quantity of a specific product in the cart by 1.
  reduceQuantity(ProductModel product) {
    // find the index of the product in the cart
    int index = _carts.indexWhere((element) => element.productModel == product);
    // decrement the quantity by 1.
    _carts[index].quantity = _carts[index].quantity - 1;
    notifyListeners(); // Update the quantity change
  }

  // check if a product already exists in the cart
  // return true if the product is in the cart, false otherwise
  productExist(ProductModel productZoh) {
    if(_carts.indexWhere((element) => element.productModel == productZoh) == -1){
      return false;
    } else {
      return true;
    }
  }

  // calculates the total price of all items in the cart
  double totalCart() {
    double total = 0; // initialize the total to 0,
    for (var i = 0; i < _carts.length; i++) {
      // adds the price for each cart item
      total = total + _carts[i].quantity * _carts[i].productModel.price;
    }
    return total;  // returns the total price of all cart items.
  }
}