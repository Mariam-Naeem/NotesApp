import 'package:flutter/material.dart';
import 'package:notes/Widgets/edit_view_body.dart';
import 'package:notes/models/note_model.dart';

class EditView extends StatelessWidget {
  const EditView({super.key,required this.note});
 final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(note: note,),
    );
  }
}