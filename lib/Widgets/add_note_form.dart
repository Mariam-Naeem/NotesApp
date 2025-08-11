import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Widgets/custom_botton.dart';
import 'package:notes/Widgets/custom_textfield.dart';
import 'package:notes/cubits/Addnote_cubit/Addnotes_cubit.dart';
import 'package:notes/models/note_model.dart';

class AddnoteForm extends StatefulWidget {
  const AddnoteForm({super.key});

  @override
  State<AddnoteForm> createState() => _AddnoteFormState();
}

class _AddnoteFormState extends State<AddnoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode =
      AutovalidateMode.disabled; //عشان اظهرله ايرور لو دخل حاجة غلط
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 32),
          CustomTextfield(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          SizedBox(height: 16),
          CustomTextfield(
            onSaved: (value) {
              subtitle = value;
            },
            hintText: 'Content',
            maxline: 5,
          ),
          SizedBox(height: 30),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var notemodel = NoteModel(
                  title: title!,
                  subtitle: subtitle!,
                  date:DateTime.now().toString(),
                  color: Colors.amber.value,
                );
                BlocProvider.of<NotesCubit>(context).addNote(notemodel);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
