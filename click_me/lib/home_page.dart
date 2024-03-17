import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Use (_) modifier before variables to indicate that they are private
  // private means they can only be accessed within the scope
  int _likeCounter = 0;
  int _loveCounter = 0;
  int _unlikeCounter = 0;

  void _increaseLike() {
    setState(() {
      _likeCounter++;
    });
  }

  void _increaseLove() {
    setState(() {
      _loveCounter += Random().nextInt(5); // 0..4
    });
  }

  void _increaseUnlike() {
    setState(() {
      _unlikeCounter += Random().nextInt(20); // 0..19
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Click Me'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/leaderboard',
                arguments: {
                  'result': (_likeCounter + _loveCounter) - _unlikeCounter,
                },
              );
            },
            icon: const Icon(Icons.leaderboard),
          ),
        ],
      ),
      body: Container(
        width: double
            .maxFinite, // [double.maxFinite] width = 1.7976931348623157e+308
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color:
              Theme.of(context).primaryColor.withOpacity(0.1), // transparency
        ),
        padding: const EdgeInsets.all(
            20), // the space between the border and the content
        margin: const EdgeInsets.all(12), // the space outside the border
        child: Column(
          children: [
            Text(
              'This is your Click Me post!',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 100,
            ), // an empty container
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '$_likeCounter\n 👍',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '$_loveCounter\n 💖',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.green,
                      ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '$_unlikeCounter\n 👎',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.red,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FilledButton.icon(
            onPressed: _increaseLike,
            icon: const Icon(
              Icons.thumb_up,
              size: 18,
            ),
            label: const Text('Like'),
          ),
          FilledButton.icon(
            onPressed: _increaseLove,
            style: FilledButton.styleFrom(backgroundColor: Colors.green),
            icon: const Icon(
              Icons.favorite,
              size: 18,
            ),
            label: const Text('Love'),
          ),
          FilledButton.icon(
            onPressed: _increaseUnlike,
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            icon: const Icon(
              Icons.thumb_down,
              size: 18,
            ),
            label: const Text('Unlike'),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
