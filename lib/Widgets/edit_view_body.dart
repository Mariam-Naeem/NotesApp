import 'package:flutter/material.dart';
import 'package:notes/Widgets/custom_app_bar.dart';
import 'package:notes/Widgets/custom_textfield.dart';

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
           SizedBox(height: 50,),
          CustomTextfield(hintText: 'title'),
           SizedBox(height: 16,),
          CustomTextfield(hintText: 'content',maxline: 5,),
          
        ],
      ),
    );
  }
}
