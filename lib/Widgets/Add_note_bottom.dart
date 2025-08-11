import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes/Widgets/add_note_form.dart';
import 'package:notes/Widgets/custom_botton.dart';
import 'package:notes/Widgets/custom_textfield.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubits/Addnote_cubit/Addnotes_cubit.dart';

class AddNoteBottomSheet extends StatelessWidget {
  AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<NotesCubit, NotesState>(
          listener: (context, state) {
            if (state is AddNoteFailure) {
              print('failied ${state.errMessage}');
            }
            if (state is AddNoteSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is AddNoteLoading ? true : false,
              child: SingleChildScrollView(child: AddnoteForm()),
            );
          },
        ),
      ),
    );
  }
}
