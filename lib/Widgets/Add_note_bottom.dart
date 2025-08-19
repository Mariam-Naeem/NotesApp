import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes/Widgets/add_note_form.dart';
import 'package:notes/Widgets/custom_botton.dart';
import 'package:notes/Widgets/custom_textfield.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubits/Addnote_cubit/Addnotes_cubit.dart';
import 'package:notes/cubits/notes_cubit/read_notes_cubit.dart';
class AddNoteBottomSheet extends StatelessWidget {
  AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: BlocConsumer<NotesCubit, NotesState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            print('failied ${state.errMessage}');
          }
          if (state is AddNoteSuccess) {
            BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer( // بيمنع أي تفاعل (touch / clicks) مع الـ Widgets اللي جواه
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(child: AddnoteForm()),
            ),
          );
        },
      ),
    );
  }
}
