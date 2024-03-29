import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:note_pad/constants/constants.dart';
import 'package:note_pad/data/model/note_model.dart';
import 'package:note_pad/repo/repository.dart';
import 'package:note_pad/view/screens/add_edit/add_edit.dart';
import 'package:note_pad/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shamsi_date/shamsi_date.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Consumer<Repository<NoteModel>>(
              builder: (context, repository, child) {
            return DefaultTabController(
              initialIndex: Jalali.now().month - 1,
              length: 12,
              child: Scaffold(
                body: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(color: primaryColor),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddOrEditScreen(
                                                    note: NoteModel())));
                                  },
                                  child: Icon(
                                    CupertinoIcons.add,
                                  ),
                                ),
                                Text(
                                  'یادداشت ها',
                                  style: themeData.textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          TabBar(
                            isScrollable: true,
                            tabs: //month in persian
                                monthsInPersian.map((e) => Text(e)).toList(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: List.generate(
                          monthsInPersian.length,
                          (monthIndex) {
                            List<NoteModel> ListModelDesiredMonth =
                                repository.getByMonthDate(monthIndex + 1);
                            return Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: ListView.builder(
                                  itemBuilder: (context, noteModelIndex) {
                                    int trueNoteModelIndex = noteModelIndex - 1;
                                    NoteModel desiredNote =
                                        ListModelDesiredMonth[
                                            trueNoteModelIndex];
                                    if (ListModelDesiredMonth.isNotEmpty) {
                                      if (noteModelIndex == 0) {
                                        return Row(
                                          children: [
                                            TimelineConnector(
                                                heightOfConnector: 40)
                                          ],
                                        );
                                      } else if (noteModelIndex ==
                                          ListModelDesiredMonth.length) {
                                        return Column(
                                          children: [
                                            TimelineIndicator(
                                              dayName: getWeekDay(desiredNote
                                                  .createdAt
                                                  .toJalali()
                                                  .weekDay),
                                              dayNumber: desiredNote.createdAt
                                                  .toJalali()
                                                  .day,
                                              onTap: () {
                                                return DeleteDialoge(
                                                    context,
                                                    repository,
                                                    monthIndex,
                                                    noteModelIndex);
                                              },
                                            ),
                                            NoteCard(
                                              heightOfConnector: 0,
                                              describtionText:
                                                  desiredNote.description,
                                              titleText: desiredNote.title,
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Stack(
                                          children: [
                                            Column(
                                              children: [
                                                TimelineIndicator(
                                                    dayName: getWeekDay(
                                                        desiredNote.createdAt
                                                            .toJalali()
                                                            .weekDay),
                                                    dayNumber: desiredNote
                                                        .createdAt
                                                        .toJalali()
                                                        .day,
                                                    onTap: () {
                                                      return DeleteDialoge(
                                                          context,
                                                          repository,
                                                          monthIndex,
                                                          noteModelIndex);
                                                    }),
                                                NoteCard(
                                                  heightOfConnector: 220,
                                                  describtionText:
                                                      ListModelDesiredMonth[
                                                              trueNoteModelIndex]
                                                          .description,
                                                  titleText:
                                                      ListModelDesiredMonth[
                                                              trueNoteModelIndex]
                                                          .title,
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: 60,
                                                  left: 60,
                                                  top: 193),
                                              child: Divider(
                                                color: subtitleColor,
                                              ),
                                            ),
                                          ],
                                        );
                                      }
                                    } else {
                                      return EmptyWidget();
                                    }
                                  },
                                  itemCount: ListModelDesiredMonth.isNotEmpty
                                      ? ListModelDesiredMonth.length + 1
                                      : 1),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Future<dynamic> DeleteDialoge(BuildContext context,
      Repository<NoteModel> repository, int monthIndex, int noteModelIndex) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Text('آیا از حذف این یادداشت اطمینان دارید؟'),
              actions: [
                TextButton(
                    child: Text('خیر'),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                TextButton(
                    child: Text('بله'),
                    onPressed: () {
                      repository.delete(repository
                          .getByMonthDate(monthIndex + 1)[noteModelIndex - 1]);
                      Navigator.pop(context);
                    })
              ]);
        });
  }

  String getWeekDay(int day) {
    switch (day) {
      case 1:
        return 'شنبه';
      case 2:
        return 'یکشنبه';
      case 3:
        return 'دوشنبه';
      case 4:
        return 'سه شنبه';
      case 5:
        return 'چهارشنبه';
      case 6:
        return 'پنجشنبه';
      case 7:
        return 'جمعه';
      default:
        return '';
    }
  }
}
