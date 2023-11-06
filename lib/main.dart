import 'package:flutter/material.dart';
import 'package:note_pad/controller/index_edit_controller.dart';
import 'package:note_pad/controller/note_controller.dart';
import 'package:note_pad/controller/theme_controller.dart';
import 'package:note_pad/controller/validator/validator_input_dialog.dart';
import 'package:note_pad/ui/constants/constants.dart';
import 'package:note_pad/ui/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeController()),
        ChangeNotifierProvider(create: (_) => DarkModeIconController()),
        ChangeNotifierProvider(create: (_) => NoteController()),
        ChangeNotifierProvider(create: (_) => InputValidation()),
        ChangeNotifierProvider(create: (_) => IndexController()),
      ],
      child: Consumer<ThemeController>(builder: (_, themeController, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('fa', 'IR'),
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors().white,
            useMaterial3: true,
            fontFamily: 'Yekan',
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
            fontFamily: 'Yekan',
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
          themeMode: themeController.getThemeMode,
          home: MainScreen(),
        );
      }),
    );
  }
}
