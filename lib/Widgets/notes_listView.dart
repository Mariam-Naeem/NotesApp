import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Widgets/custom_note_item.dart';
import 'package:notes/cubits/notes_cubit/read_notes_cubit.dart';
import 'package:notes/models/note_model.dart';

class NodesListView extends StatelessWidget {
  NodesListView({super.key});
  var data = const [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNotesCubit, ReadNotesState>(
      builder: (context, state) {
           List<NoteModel> notes =  BlocProvider.of<ReadNotesCubit>(context).notes ?? [];
       
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount: notes.length,
            padding: EdgeInsets.zero,

            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child:  NoteItem(note:notes[index],),
              );
            },
          ),
        );
      },
    );
  }
}
