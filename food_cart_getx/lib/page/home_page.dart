import 'package:flutter/material.dart';
import 'package:food_cart_getx/model/food_model.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Cart(homeController: _homeController),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Let's Eat Delicious Food",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
            Text(
              "Special for you",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            const LabelRow(),
            Expanded(
              child: ItemsGridView(),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemsGridView extends StatelessWidget {
  ItemsGridView({
    super.key,
  });
  final _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 8,
            childAspectRatio: 0.8,
          ),
          itemCount: _homeController.foods.length,
          itemBuilder: (context, index) {
            final foodItem = _homeController.foods[index];
            return FoodItemWidget(foodItem: foodItem);
          }),
    );
  }
}

class FoodItemWidget extends StatelessWidget {
  FoodItemWidget({
    super.key,
    required this.foodItem,
  });

  final FoodModel foodItem;
  final _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.green,
        ),
        Text(foodItem.name),
        Text(foodItem.category),
        Text("${foodItem.price} MMK"),
        FilledButton(
          onPressed: () => _homeController.addToCart(foodItem.name),
          child: const Text('Add'),
        ),
      ],
    );
  }
}

class LabelRow extends StatelessWidget {
  const LabelRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.emoji_food_beverage),
            label: const Text('label'),
          );
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            width: 15,
          );
        },
        itemCount: 10,
      ),
    );
  }
}

class Cart extends StatelessWidget {
  const Cart({
    super.key,
    required HomeController homeController,
  }) : _homeController = homeController;

  final HomeController _homeController;

  @override
  Widget build(BuildContext context) {
    return Badge(
      label: Obx(() {
        return Text('${_homeController.count}');
      }),
      textStyle: const TextStyle(
        fontSize: 16,
      ),
      child: FloatingActionButton.small(
        onPressed: _homeController.showCart,
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

// Center(
// child: FilledButton(
// onPressed: _homeController.increment,
// child: Text('Add to cart'),
// ),
// )
