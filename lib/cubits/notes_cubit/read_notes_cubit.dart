
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes/constants.dart';
import 'package:notes/models/note_model.dart';

part 'read_notes_state.dart';

class ReadNotesCubit extends Cubit<ReadNotesState> {
  ReadNotesCubit() : super(ReadNotesInitial());
  List<NoteModel>? notes;
  void fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(knotesbox);
    notes = notesBox.values.toList();
    emit(ReadNotesSuccess());
  }
}
