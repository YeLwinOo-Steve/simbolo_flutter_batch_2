import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'new_note_screen.dart';
import 'note_controller.dart';

class NoteListScreen extends StatelessWidget {
  final NoteController noteController = Get.put(NoteController());

  NoteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'ETON',
          style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 10),
        ),
      ),
      body: Obx(() {
        if (noteController.notes.isEmpty) {
          return const Center(
            child: Text(
              "No notes here!",
              style: TextStyle(fontSize: 16),
            ),
          );
        }
        return ListView.builder(
          itemCount: noteController.notes.length,
          itemBuilder: (context, index) {
            final note = noteController.notes[index];
            return ListTile(
              title: Text(note.title),
              subtitle: Text(note.content),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => noteController.deleteNote(note.id),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () => Get.to(() => NewNoteScreen()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
