import 'package:flutter/material.dart';
import 'package:note_pad/constants/constants.dart';

class AddOrEditScreen extends StatelessWidget {
  AddOrEditScreen({super.key});
  final _key = GlobalKey<FormState>();
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
                      child: TextFormField(
                        expands: true,
                        maxLines: null,
                        onTapOutside: (_) => FocusScope.of(context).unfocus(),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText: 'عنوان:',
                            labelStyle: TextStyle(fontSize: 35),
                            floatingLabelAlignment:
                                FloatingLabelAlignment.start,
                            floatingLabelBehavior:
                                FloatingLabelBehavior.always),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 400,
                      child: TextFormField(
                        expands: true,
                        maxLines: null,
                        onTapOutside: (_) => FocusScope.of(context).unfocus(),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText: 'توضیحات:',
                            labelStyle: TextStyle(fontSize: 35),
                            floatingLabelAlignment:
                                FloatingLabelAlignment.start,
                            floatingLabelBehavior:
                                FloatingLabelBehavior.always),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
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
