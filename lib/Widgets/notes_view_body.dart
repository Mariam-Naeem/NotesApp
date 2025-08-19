import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Widgets/custom_app_bar.dart';
import 'package:notes/Widgets/custom_note_item.dart';
import 'package:notes/Widgets/notes_listView.dart';
import 'package:notes/cubits/notes_cubit/read_notes_cubit.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(title: "notes", icon: Icons.search),
          Expanded(child: NodesListView()),
        ],
      ),
    );
  }
}
