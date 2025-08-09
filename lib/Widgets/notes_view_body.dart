import 'package:flutter/material.dart';
import 'package:notes/Widgets/custom_app_bar.dart';
import 'package:notes/Widgets/custom_note_item.dart';
import 'package:notes/Widgets/notes_listView.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(children: [SizedBox(height: 50,),CustomAppBar(title: "notes",icon: Icons.search,),Expanded(child: NodesListView())]),
    );
  }
}

