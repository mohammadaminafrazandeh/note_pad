import 'package:flutter/material.dart';
import 'package:note_pad/controller/provider/add_or_edit.dart';
import 'package:note_pad/controller/provider/index.dart';
import 'package:note_pad/controller/service/database/hive_service.dart';
import 'package:note_pad/controller/service/routes/routes.dart';
import 'package:note_pad/model/note.dart';
import 'package:note_pad/view/constants/constants.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AddOrEdit()),
        ChangeNotifierProvider(create: (context) => HiveService(),),
        ChangeNotifierProvider(create: (context) => IndexProvider(),)
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        locale: const Locale('fa', 'IR'),
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors().white,
          useMaterial3: true,
          fontFamily: 'Iransans',
          colorScheme:
              ColorScheme.fromSeed(seedColor: AppColors().jasmineColor),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              foregroundColor: AppColors().auroMetalSaurusColor,
              backgroundColor: AppColors().jasmineColor),
          appBarTheme: AppBarTheme(
              backgroundColor: AppColors().jasmineColor,
              foregroundColor: AppColors().auroMetalSaurusColor),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide:
                    BorderSide(color: AppColors().auroMetalSaurusColor)),
          ),
          listTileTheme: ListTileThemeData(
              titleTextStyle: TextStyle(color: AppColors().jasmineColor),
              subtitleTextStyle:
                  TextStyle(color: AppColors().auroMetalSaurusColor)),
        ),
        darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          useMaterial3: true,
          fontFamily: 'Iransans',
          colorScheme:
              ColorScheme.fromSeed(seedColor: AppColors().jasmineColor),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              foregroundColor: AppColors().auroMetalSaurusColor,
              backgroundColor: AppColors().jasmineColor),
          appBarTheme: AppBarTheme(
              backgroundColor: AppColors().jasmineColor,
              foregroundColor: AppColors().auroMetalSaurusColor),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide:
                    BorderSide(color: AppColors().auroMetalSaurusColor)),
          ),
          listTileTheme: ListTileThemeData(
              titleTextStyle: TextStyle(color: AppColors().whiteSmokeColor),
              subtitleTextStyle:
                  TextStyle(color: AppColors().auroMetalSaurusColor)),
        ),
        themeMode: ThemeMode.light,
      ),
    );
  }
}
