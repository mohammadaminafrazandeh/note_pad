import 'package:flutter/material.dart';
import 'package:note_pad/constants/constants.dart';
import 'package:note_pad/widgets/widgets.dart';

class AddOrEditScreen extends StatelessWidget {
  AddOrEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'افزودن',
              style: theme.textTheme.titleLarge!.copyWith(fontSize: 30),
            ),
          ),
          body: Form(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                      //* title of the note
                      child: MyTextFormField(
                        labelText: 'عنوان:',
                        onSaved: (value) {
                          if (value != null && value.trim().isNotEmpty) {}
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                        height: 400,
                        //* description of the note
                        child: MyTextFormField(
                            labelText: 'توضیحات:',
                            onSaved: (value) {
                              if (value != null && value.trim().isNotEmpty) {}
                            })),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'ذخیره',
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
