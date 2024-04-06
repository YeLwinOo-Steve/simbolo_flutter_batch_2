import 'package:contact_storage/shared_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'contact_controller.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final controller = Get.find<ContactController>();
  final cons = Constants();
  @override
  void initState() {
    super.initState();
    controller.getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: Obx(
        () {
          return ListView.builder(
            itemCount: controller.phoneNumbers.length,
            itemBuilder: (context, index) {
              final String name = cons.names[index];
              return ListTile(
                title: Text(name),
                subtitle: Text(controller.phoneNumbers[index]),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addContacts();
        },
        child: const Text('Add'),
      ),
    );
  }
}
