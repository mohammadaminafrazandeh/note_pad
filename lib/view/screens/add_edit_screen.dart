import 'package:flutter/material.dart';
import 'package:note_pad/constants/constants.dart';
import 'package:note_pad/model/note_model.dart';
import 'package:note_pad/service/HiveService.dart';

class AddOrEditScreen extends StatelessWidget {
  AddOrEditScreen({super.key});
  final _key = GlobalKey<FormState>();
  final NoteModel note =
      NoteModel(title: '', description: '', createdAt: '', updatedAt: null);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'افزودن',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 30),
            ),
          ),
          body: Form(
            key: _key,
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
                          if (value != null && value.trim().isNotEmpty) {
                            note.title = value;
                          }
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
                              if (value != null && value.trim().isNotEmpty) {
                                note.description = value;
                              }
                            })),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            _key.currentState!.save();
                            note.createdAt = DateTime.now().toString();
                            print(
                                '++++++++++++++++note is ${note.title}+${note.description}+${note.createdAt}+++++++++++++');
                            HiveService.add(
                              noteBox,
                              note,
                            ); //* add note to {noteBox} box in hive as {list}
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          'ذخیره',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
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

class MyTextFormField extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String labelText;
  const MyTextFormField({
    required this.onSaved,
    required this.labelText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      expands: true,
      maxLines: null,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 35),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: FloatingLabelBehavior.always),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'لطفا این فیلد را پر کنید';
        } else {
          return null;
        }
      },
      onSaved: onSaved,
    );
  }
}
