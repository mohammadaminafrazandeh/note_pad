import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_pad/controller/add_or_edit.dart';
import 'package:note_pad/controller/index.dart';

import 'package:note_pad/service/hive_service.dart';
import 'package:note_pad/constants/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'دفترچه یادداشت',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        floatingActionButton:
            Consumer<AddOrEdit>(builder: (_, addOrEdit, child) {
          return FloatingActionButton(
              onPressed: () {
                addOrEdit.isEditing = false;
                context.push('/addscreen'); //! route to add_screen.dart
              },
              child: Icon(Icons.add));
        }),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        body: Consumer<HiveService>(
          builder: (_, hiveService, child) {
            hiveService.getItems();

            if (hiveService.notes.isEmpty) {
              return Padding(
                padding: const EdgeInsets.all(100.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      "assets/animations/Animation - 1699973281091.json", //.animation
                    ),
                    Text(
                      'یادداشتی وارد نشده!',
                      textDirection: TextDirection.rtl,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              );
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 30,
                  // crossAxisSpacing: 0,
                ),
                padding: const EdgeInsets.all(50.0),
                itemCount: hiveService.notes.length,
                itemBuilder: (context, index) {
                  hiveService.desierdTitle(index);
                  hiveService.desierdDecription(index);
                  return Stack(
                    children: [
                      Consumer2<AddOrEdit, IndexProvider>(
                        builder: (_, addOrEdit, indexProvider, child) {
                          return GestureDetector(
                            onLongPress: () {
                              addOrEdit.isEditing = true;
                              indexProvider.index = index;
                              context.push(
                                  '/addscreen'); //! route to add_screen.dart
                            },
                            child: Card(
                              surfaceTintColor: AppColors().jasmineColor,
                              elevation: 2,
                              color: AppColors().white,
                              child: ListView(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          hiveService.notes[index].title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Text(
                                            hiveService
                                                .notes[index].description,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                          onPressed: () {
                            hiveService.deleteBox(index);
                          },
                          icon: Icon(Icons.delete),
                          style: ElevatedButton.styleFrom()),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
