import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_pad/controller/add_or_edit.dart';
import 'package:note_pad/controller/index.dart';

import 'package:note_pad/service/hive_service.dart';
import 'package:note_pad/model/note.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final Note _note = Note(title: '', description: '');
  @override
  Widget build(BuildContext context) {
    return Consumer3<AddOrEdit, IndexProvider, HiveService>(
        builder: (context, addOrEdit, indexProvider, hiveService, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            addOrEdit.isEditing == false
                ? 'اضافه کردن یادداشت'
                : 'ویرایش یادداشت',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      initialValue: addOrEdit.isEditing == true
                          ? hiveService.notes[indexProvider.index].title
                          : null,
                      validator: (value) {
                        if (value == null) {
                          return 'نال بود';
                        } else if (value.trim().isEmpty) {
                          return 'خالی بود';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) => _note.title = newValue!,
                      decoration: InputDecoration(label: const Text('عنوان')),
                    ),
                    SizedBox(height: 25),
                    TextFormField(
                        initialValue: addOrEdit.isEditing == true
                            ? hiveService.notes[indexProvider.index].description
                            : null,
                        validator: (value) {
                          if (value == null) {
                            return 'نال بود';
                          } else if (value.trim().isEmpty) {
                            return 'خالی بود';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (newValue) => _note.description = newValue!,
                        decoration:
                            InputDecoration(label: const Text('توضیحات'))),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          child: Consumer<AddOrEdit>(
                              builder: (_, addOrEdit, child) {
                            return Text(addOrEdit.isEditing == false
                                ? 'ذخیره'
                                : 'ویرایش');
                          }),
                          onPressed: () {
                            if (addOrEdit.isEditing == false) {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                hiveService.createItem(_note);

                                context.go('/');
                              }
                            } else {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                hiveService.notes[indexProvider.index].title =
                                    _note.title;
                                hiveService.notes[indexProvider.index]
                                    .description = _note.description;

                                context.go('/');
                              }
                              ;
                            }
                          },
                        ),
                        ElevatedButton(
                          child: const Text('انصراف'),
                          onPressed: () {
                            context.pop();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
