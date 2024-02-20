// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_pad/constants/constants.dart';
import 'package:note_pad/data/model/note_model.dart';
import 'package:note_pad/repo/repository.dart';
import 'package:note_pad/view/screens/add_edit/add_edit.dart';
import 'package:note_pad/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<String> monthsInPersian = [
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند'
  ];
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Consumer<Repository<NoteModel>>(
            builder: (context, repository, child) {
          return DefaultTabController(
            length: repository.yearMonthExist().length,
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
                                          builder: (context) => AddOrEditScreen(
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
                        TabBar(tabs: [
                          for (int i = 0;
                              i < repository.yearMonthExist().length;
                              i++)
                            Tab(
                              child: Text(
                                '${monthsInPersian[repository.yearMonthExist().values.toList()[i] - 1]} ${repository.yearMonthExist().keys.toList()[i].toString()}',
                              ),
                            ),
                        ])
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        for (int i = 0;
                            i < repository.yearMonthExist().length;
                            i++)
                          ListView.builder(
                              itemCount: repository
                                  .getByDateYearMonth(
                                      repository
                                          .yearMonthExist()
                                          .keys
                                          .toList()[i],
                                      repository
                                          .yearMonthExist()
                                          .values
                                          .toList()[i])
                                  .length,
                              itemBuilder: (context, index) {
                                return NoteCard(
                                    heightOfConnector: 40,
                                    describtionText: repository
                                        .getByDateYearMonth(
                                            repository
                                                .yearMonthExist()
                                                .keys
                                                .toList()[i],
                                            repository
                                                .yearMonthExist()
                                                .values
                                                .toList()[i])[i]
                                        .description,
                                    titleText: repository
                                        .getByDateYearMonth(
                                            repository
                                                .yearMonthExist()
                                                .keys
                                                .toList()[i],
                                            repository
                                                .yearMonthExist()
                                                .values
                                                .toList()[i])[i]
                                        .title);
                              }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
