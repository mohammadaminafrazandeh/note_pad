// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:note_pad/controller/index_edit_controller.dart';
import 'package:note_pad/controller/validator/validator_input_dialog.dart';
import 'package:provider/provider.dart';

import 'package:note_pad/controller/note_controller.dart';

class EditInputDialog extends StatelessWidget {
  EditInputDialog({
    Key? key,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer3<NoteController, IndexController, InputValidation>(
        builder: (_, noteController, indexController, inputValidation, child) {
      return Form(
        key: _formKey,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('ویرایش یادداشت'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: noteController
                      .getNotes[indexController.getindexEdit].title,
                  decoration: InputDecoration(
                      hintText: 'عنوان را وارد کنید',
                      errorText:
                          inputValidation.getErrorAndValueItemsTitle.error),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'عنوان نمی‌تواند خالی باشد';
                    }
                    return null; // Return null if the input is valid
                  },
                  onChanged: (value) {
                    inputValidation
                        .validationTitle(value); //for validating on change
                  },
                  onSaved: (newValue) {
                    inputValidation.setValueOnSaveTitle(newValue);
                    noteController.modifyNoteTitle(
                        indexController.getindexEdit, newValue);
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: noteController
                      .getNotes[indexController.getindexEdit].describtion,
                  decoration: InputDecoration(
                      hintText: 'توضیحات را وارد کنید',
                      errorText:
                          inputValidation.getErrorAndValueItemsSubtitle.error),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'توضیحات نمی‌تواند خالی باشد';
                    }
                    return null; // Return null if the input is valid
                  },
                  onChanged: (value) {
                    inputValidation
                        .validationSubtitle(value); //for validating on change
                  },
                  onSaved: (newValue) {
                    inputValidation.setValueOnSaveDescribtion(newValue);
                    noteController.modifyNoteDescribtion(
                        indexController.getindexEdit, newValue);
                  },
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Navigator.pop(_);
                          }
                        },
                        // },
                        child: const Icon(Icons.check)),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(_);
                        },
                        child: const Icon(Icons.cancel_outlined))
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
