import 'package:flutter/material.dart';
import 'package:note_pad/controller/index_edit_controller.dart';
import 'package:note_pad/controller/note_controller.dart';
import 'package:note_pad/controller/theme_controller.dart';
import 'package:note_pad/ui/componets/input_dialog/edit_alert_dialog_textfiald.dart';
import 'package:note_pad/ui/constants/constants.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer4<DarkModeIconController, ThemeController, NoteController,
            IndexController>(
        builder: (context, darkModeIconcontroller, themeController,
            noteController, indexController, child) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              darkModeIconcontroller.changeIcon();
              themeController.changeTheme();
            },
            child: darkModeIconcontroller.getIconThemeMode),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        body: (noteController.getNotes.isEmpty)
            ? Center(
                child: Text(
                  'متنی برای نشان دادن وارد نکردید',
                  style: TextStyle(color: AppColors().auroMetalSaurusColor),
                ),
              )
            : Directionality(
                textDirection: TextDirection.rtl,
                child: ListView.builder(
                  itemCount: noteController.getNotes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(noteController.getNotes[index].title!),
                      subtitle:
                          Text(noteController.getNotes[index].describtion!),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              indexController.setIndex(index);
                              return  EditInputDialog();
                            });
                      },
                      onLongPress: () {
                        noteController.removeNote(index);
                      },
                    );
                  },
                ),
              ),
      );
    });
  }
}
