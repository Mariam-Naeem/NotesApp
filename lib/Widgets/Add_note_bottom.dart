import 'package:flutter/material.dart';
import 'package:notes/Widgets/custom_textfield.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 32),
          CustomTextfield(hintText: 'Title'),
           SizedBox(height: 16),
          CustomTextfield(hintText: 'Content',maxline: 5,),
        ],
      ),
    );
  }
}
