import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_pad/constants/constants.dart';
import 'package:note_pad/data/model/note_model.dart';
import 'package:note_pad/data_source/hive_source.dart';
import 'package:note_pad/repo/repository.dart';
import 'package:note_pad/theme/theme.dart';
import 'package:note_pad/view/screens/home/home.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(notesBox);
  runApp(ChangeNotifierProvider(
      create: (context) =>
          Repository(localDataSource: HiveNotesSource(Hive.box(notesBox))),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Pad',
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa', 'IR'),
      theme: MyLightTheme(),
      themeMode: ThemeMode.light,
      home: HomeScreen(),
    );
  }
}
