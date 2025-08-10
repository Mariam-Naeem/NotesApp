import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'Addnotes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  void addNote() {
    // هنا تحط منطق إضافة الملاحظات
  }
}
