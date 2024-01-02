import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:note_pad/model/note_model.dart';
import 'package:note_pad/service/IsarService.dart';

class AddOrEditScreen extends StatelessWidget {
  AddOrEditScreen({super.key});
  final QuillController _quillController = QuillController.basic();
  late final NoteModel _note = NoteModel(
    title: '',
    description: '',
    createdAt: '',
  );
  final _textFormFieldKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('افزودن یادداشت',
                  style: Theme.of(context).textTheme.titleLarge),
              actions: [
                //* save button
                TextButton.icon(
                    onPressed: () {
                      //* describtion saving process
                      _note.description = _quillController.document
                          .toDelta()
                          .toJson()
                          .toString();

                      //* title saving process
                      _textFormFieldKey.currentState!.validate()
                          ? _textFormFieldKey.currentState!.save()
                          : null;

                      //* cratedAt saving process
                      _note.createdAt = DateTime.now().toString();

                      //* add note to Isar database
                      var isar = IsarService();
                      isar.addNote(_note);

                      //* go back
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.save,
                    ),
                    label: Text(
                      'ذخیره',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ))
              ],
            ),
            body: Form(
              key: _textFormFieldKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text('عنوان:',
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 100,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'عنوان نباید خالی باشد';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (newValue) {
                          _note.title = newValue!;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text('توضیحات:',
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(Icons.keyboard_arrow_down_rounded,
                            color: Theme.of(context).primaryColorDark),
                        Text('تنظیمات نوشتار قابلیت اسکرول دارد'),
                        SizedBox(width: 20),
                        Icon(Icons.arrow_back_rounded,
                            color: Theme.of(context).primaryColorDark),
                        Icon(Icons.arrow_forward_rounded,
                            color: Theme.of(context).primaryColorDark),
                      ],
                    ),
                    Divider(),
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: QuillToolbar.simple(
                          configurations: QuillSimpleToolbarConfigurations(
                            toolbarSectionSpacing: 10,
                            multiRowsDisplay: true,
                            controller: _quillController,
                            showDirection: true,
                            showInlineCode: false,
                            showLink: false,
                            showAlignmentButtons: true, //* left center right
                            showBackgroundColorButton: false,
                            showCodeBlock: false,
                            showColorButton: false,
                            showFontFamily: false,
                            showDividers: false,
                            showFontSize: false,
                            showHeaderStyle: false,
                            showIndent: false,
                            showJustifyAlignment: false, //?
                            showLeftAlignment: false, //?
                            showRightAlignment: false, //?
                            showQuote: false,
                            showSearchButton: false,
                            showSubscript: false,
                            showSuperscript: false,
                            //-------------
                            customButtons: [
                              QuillToolbarCustomButtonOptions(
                                icon: Icon(Icons.mic),
                                onPressed: () {},
                              ),
                              QuillToolbarCustomButtonOptions(
                                icon: Icon(Icons.image),
                                onPressed: () {},
                              ),
                              QuillToolbarCustomButtonOptions(
                                icon: Icon(Icons.video_library),
                                onPressed: () {},
                              ),
                              QuillToolbarCustomButtonOptions(
                                icon: Icon(Icons.attach_file),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Icon(Icons.warning_rounded,
                            color: Theme.of(context).primaryColorDark),
                        SizedBox(width: 10),
                        Text('برای تایپ فارسی راستچین کنید '),
                        SizedBox(width: 20),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      height: 500,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: QuillEditor.basic(
                        configurations: QuillEditorConfigurations(
                            controller: _quillController),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
