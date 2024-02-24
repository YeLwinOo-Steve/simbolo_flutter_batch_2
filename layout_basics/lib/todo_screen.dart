import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});
  final paleGreen = Color(0xFFC7D3B6);
  final indigo = Color(0xFF9AA7EA);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: paleGreen,
        title: const Text(
          'TODO List',
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: indigo,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TopmostRow(paleGreen: paleGreen, indigo: indigo),
            const SizedBox(
              height: 14,
            ),
            TopRow(),
            const SizedBox(
              height: 14,
            ),
            TodoCard(paleGreen: paleGreen),
            const SizedBox(
              height: 14,
            ),
            TodoCard(paleGreen: paleGreen),
            const SizedBox(
              height: 14,
            ),
            TodoCard(paleGreen: paleGreen),
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 80,
            margin: EdgeInsets.only(top: 20),
            width: double.maxFinite,
            color: indigo,
          ),
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: paleGreen,
              foregroundColor: Colors.white,
            ),
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.paleGreen,
  });

  final Color paleGreen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        children: [
          Container(width: 150, height: 150, color: paleGreen),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Title',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const Text('Drink 6 liters of water'),
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: paleGreen,
                  foregroundColor: Colors.black,
                ),
                child: const Text('Todo'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TopRow extends StatelessWidget {
  const TopRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Today Tasks'),
        Text('Filter'),
      ],
    );
  }
}

class TopmostRow extends StatelessWidget {
  const TopmostRow({
    super.key,
    required this.paleGreen,
    required this.indigo,
  });

  final Color paleGreen;
  final Color indigo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 150,
          height: 40,
          color: paleGreen,
          child: Center(child: Text('Today')),
        ),
        Container(
          width: 150,
          height: 40,
          color: indigo,
          child: Center(child: const Text('Done')),
        ),
      ],
    );
  }
}
