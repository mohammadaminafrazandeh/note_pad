import 'package:flutter/material.dart';
import 'package:note_pad/ui/componets/input_dialog/add_alert_dialog_textfield.dart';
import 'package:note_pad/ui/constants/constants.dart';
import 'package:note_pad/ui/screens/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors().white,
        appBar: AppBar(
          backgroundColor: AppColors().jasmineColor,
          title: const Text('دفترچه یادداشت'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) =>
                     InputDialog()); //! alert_dialog_textfield
          },
          child: const Icon(Icons.add),
        ),
        body: Homescreen(),
      ),
    );
  }
}
