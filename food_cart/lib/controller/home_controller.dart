import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/food_model.dart';
import '../widgets/cart_dialog.dart';

class HomeController extends GetxController {
  var count = RxInt(0);

  final List<FoodModel> foods = [
    FoodModel(name: "Shan Noodle", category: "snack", price: 3000),
    FoodModel(name: "Myee Shay", category: "snack", price: 5000),
    FoodModel(name: "Fried Rice", category: "food", price: 3500),
    FoodModel(name: "Dimple", category: "snack", price: 2000),
    FoodModel(name: "Nan Gyi Thoke", category: "snack", price: 2000),
  ];

  RxMap<String, int> cartItems = <String, int>{}.obs;

  void increment() {
    count++;
  }

  void showCart() {
    Get.dialog(
      CartDialog(),
    );
  }

  void addToCart(String name) {
    cartItems[name] = (cartItems[name] ?? 0) + 1;
  }
}
