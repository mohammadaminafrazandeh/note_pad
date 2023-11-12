import 'package:flutter/material.dart';
import 'package:note_pad/view/constants/constants.dart';
import 'package:note_pad/view/screens/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
         
          home: HomeScreen(),
        );
  }
}
