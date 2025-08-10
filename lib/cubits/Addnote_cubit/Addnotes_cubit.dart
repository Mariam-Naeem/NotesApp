import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes/constants.dart';
import 'package:notes/models/note_model.dart';

part 'Addnotes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  void addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
    var notesBox = Hive.box(knotesbox);
   emit(AddNoteSuccess());
    await notesBox.add(note);}catch (e) {
    emit(AddNoteFailure(e.toString()));
  }
  }
}
