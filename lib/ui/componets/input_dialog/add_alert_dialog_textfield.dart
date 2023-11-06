import 'package:flutter/material.dart';
import 'package:note_pad/controller/validator/validator_input_dialog.dart';
import 'package:provider/provider.dart';
import 'package:note_pad/controller/note_controller.dart';
import 'package:note_pad/models/note_model.dart';

class InputDialog extends StatelessWidget {
  const InputDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<NoteController, InputValidation>(
        builder: (_, noteController, inputValidation, child) {
      Note addingNote = Note();

      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text('یادداشت جدید'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'عنوان',
                    errorText:
                        inputValidation.getErrorAndValueItemsTitle.error),
                onChanged: (value) {
                  inputValidation.validationTitle(value);
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'توضیحات',
                    errorText:
                        inputValidation.getErrorAndValueItemsSubtitle.error),
                onChanged: (value) {
                  inputValidation.validationSubtitle(value);
                },
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        addingNote.title = inputValidation
                            .getErrorAndValueItemsTitle.inputvalue;
                        addingNote.describtion = inputValidation
                            .getErrorAndValueItemsSubtitle.inputvalue;
                        if (addingNote.title != null &&
                            addingNote.describtion != null &&
                            addingNote.title!.trim().isNotEmpty &&
                            addingNote.describtion!.trim().isNotEmpty) {
                          noteController.addNote(addingNote);
                          inputValidation.resterTitle();
                          inputValidation.resterSubtitle();
                          Navigator.pop(_);
                        }
                      },
                      child: const Icon(Icons.check)),
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        addingNote.title = null;
                        addingNote.describtion = null;
                        inputValidation.resterTitle();
                        inputValidation.resterSubtitle();
                        Navigator.pop(_);
                      },
                      child: const Icon(Icons.cancel_outlined))
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
