import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Widgets/color_list_view.dart';
import 'package:notes/Widgets/custom_app_bar.dart';
import 'package:notes/Widgets/custom_textfield.dart';
import 'package:notes/Widgets/edit_note_color_listView.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubits/Addnote_cubit/Addnotes_cubit.dart';
import 'package:notes/cubits/notes_cubit/read_notes_cubit.dart';
import 'package:notes/models/note_model.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(
            icon: Icons.check,
            title: "Edit note",
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subtitle = content ?? widget.note.subtitle;
              widget.note.save();
              BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 50),
          CustomTextfield(
            hintText: widget.note.title,
            onChanged: (value) {
              title = value;
            },
          ),
          SizedBox(height: 16),
          CustomTextfield(
            hintText: widget.note.subtitle,
            maxline: 5,
            onChanged: (value) {
              content = value;
            },
          ),
          editnotecolorlist(note: widget.note),
        ],
      ),
    );
  }
}

