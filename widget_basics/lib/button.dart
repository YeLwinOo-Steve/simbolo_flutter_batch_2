import 'package:flutter/material.dart';

class ButtonBasics extends StatelessWidget {
  const ButtonBasics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: const Icon(Icons.volume_up),
          tooltip: 'Increase volume',
          onPressed: () {},
        ),
        FilledButton(onPressed: () {}, child: Text('Filled Button')),
        FilledButton.tonalIcon(
            onPressed: () {},
            icon: Icon(Icons.bubble_chart),
            label: Text("Filled Tonal Icon Button")),
        FilledButton.tonal(
            onPressed: () {}, child: Text('Filled Tonal Button')),
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.ads_click),
          label: Text('Filled Icon Button'),
        ),
        OutlinedButton(onPressed: () {}, child: Text('Outlined Button')),
        ElevatedButton(onPressed: () {}, child: Text("Elevated Button")),
        TextButton(onPressed: () {}, child: Text("Text Button")),
        FloatingActionButton(
          onPressed: () {},
          tooltip: "Floating Action Button",
          backgroundColor: Colors.red,
          child: Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ),
        FloatingActionButton.small(
          onPressed: () {},
          child: Text("Small FAB"),
        ),
        FloatingActionButton.large(
          onPressed: () {},
          child: Text("Large FAB"),
        ),
        FloatingActionButton.extended(
            onPressed: () {}, label: Text("Extended FAB")),
      ],
    );
  }
}
