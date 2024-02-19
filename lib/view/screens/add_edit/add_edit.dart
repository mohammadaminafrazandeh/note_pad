import 'package:flutter/material.dart';
import 'package:note_pad/repo/repository.dart';
import 'package:provider/provider.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:note_pad/data/model/note_model.dart';

class AddOrEditScreen extends StatefulWidget {
  NoteModel note;
  AddOrEditScreen({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  State<AddOrEditScreen> createState() => _AddOrEditScreenState();
}

class _AddOrEditScreenState extends State<AddOrEditScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              widget.note.title = titleController.text;
              widget.note.description = descriptionController.text;
              widget.note.createdAt = DateTime.now();
              context.read<Repository<NoteModel>>().createOrUpdate(widget.note);
              Navigator.of(context).pop();
            },
            label: Text('ذخیره'),
          ),
          body: Form(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    SizedBox(
                      height: 150,
                      //* title of the note
                      child: MyTextFormField(
                        controller: titleController,
                        labelText: 'عنوان:',
                      ),
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                        height: 400,
                        //* description of the note
                        child: MyTextFormField(
                          controller: descriptionController,
                          labelText: 'توضیحات:',
                        )),
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
  final TextEditingController controller;
  final String labelText;
  const MyTextFormField({
    required this.controller,
    required this.labelText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: key,
      expands: true,
      maxLines: null,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 35),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: FloatingLabelBehavior.always),
    );
  }
}
