import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class CartDialog extends StatelessWidget {
  CartDialog({
    super.key,
  });

  final _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.orange.shade50,
      child: _homeController.cartItems.isEmpty
          ? const Center(
              child: Text('Please add to cart!🥹🥹'),
            )
          : GetBuilder<HomeController>(
              builder: (controller) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: FloatingActionButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Icon(Icons.close),
                      ),
                    ),
                    ...controller.cartItems.keys.map(
                      (name) {
                        final foodItem = controller.foods.firstWhereOrNull(
                          (food) => food.name == name,
                        )!;
                        int count = controller.cartItems[name] ?? 0;
                        return ListTile(
                          leading: const Icon(Icons.ramen_dining),
                          title: Text(foodItem.name),
                          subtitle: Text(foodItem.category),
                          trailing: Text(
                            "$count",
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: Colors.orange,
                            ),
                          ),
                          tileColor: Colors.orange.shade200,
                        );
                      },
                    ).toList(),
                  ],
                );
              },
            ),
    );
  }
}
