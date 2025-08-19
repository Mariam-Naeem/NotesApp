import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubits/notes_cubit/read_notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/screens/home_page.dart';
import 'package:notes/screens/loginscreen.dart';
import 'package:notes/simple_bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter(); //init to hive 
  Hive.registerAdapter(NoteModelAdapter()); //هبدا اخزن الداتا
  await Hive.openBox<NoteModel>(knotesbox); 

  Bloc.observer = SimpleBlocObserver(); // اشوف ايه التغيرات اللي حصلت

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReadNotesCubit(),// fetch
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      
        home: FirebaseAuth.instance.currentUser == null
            ? LoginPage()
            : const NotesView(),
      ),
    );
  }
}
