import 'package:flutter/material.dart';
import 'package:notes/Widgets/Add_note_bottom.dart';
import 'package:notes/Widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (context) {
              return AddNoteBottomSheet();
            },
          );
        },
        child: Icon(Icons.add),
        shape: CircleBorder(),
        mini: true,
      ),
      body: const NotesViewBody(),
    );
  }
}
