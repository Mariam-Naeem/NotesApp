import 'package:flutter/material.dart';
import 'package:notes/Widgets/custom_app_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
         SizedBox(height: 50,),
          CustomAppBar(icon: Icons.check,title: "Edit note",),
        ],
      ),
    );
  }
}
