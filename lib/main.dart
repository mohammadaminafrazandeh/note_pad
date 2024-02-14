import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_pad/constants/constants.dart';
import 'package:note_pad/data/model/note_model.dart';
import 'package:note_pad/routes/routes.dart';
import 'package:note_pad/theme/theme.dart';

void main() async {
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox(notesBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Note Pad',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa', 'IR'),
      theme: MyLightTheme(),
      themeMode: ThemeMode.light,
    );
  }
}
