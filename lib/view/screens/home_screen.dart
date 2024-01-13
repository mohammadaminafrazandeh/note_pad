// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_pad/constants/constants.dart';
import 'package:note_pad/model/note_model.dart';
import 'package:note_pad/repository/note_repo.dart';

import 'package:note_pad/service/HiveService.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  //* list of months for tabbar
  final List<String> Months = [
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

  //! temporary const files
  final String describtionTest =
      'این تست توضیحات میباشد لذا متن بلند تری برای آن در نظر گرفته شده چون توضیحات معمولا طولانی تر از عنوان یا بخش های دیگر هستند و نیاز به این دارند که آور فلوشان با توجه به اسکرین تنظیم شود این ها تست های بیشتری هست برای اضافه کردن به متن دیسکریبشن برای تست بیشتر';
  final String describtionTest2 =
      'این تست توضیحات میباشد ولی نمونه ی کوچکت تر  برای نشون دادن متن های کوتاهتر بوده و نیاز به این دارند که آور فلوشان با توجه به اسکرین تنظیم شود';
  final String describtionTest3 =
      'این نمونه کوچک ترین خواهد بود برای تست بیشتر!';
  final String titleTest = 'تست عنوان 1';
  final String titleTest2 = 'تست طولانی تر عنوان 2 ';
  final String titleTest3 =
      'تست خیلی طولاتی تر تر و مسخره طولانی برای یک عنوان 3';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DefaultTabController(
          length: 12,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'یادداشت ها',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 30),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.push('/addscreen');
                  },
                  icon:
                      Icon(Icons.add, color: Theme.of(context).iconTheme.color),
                ),
              ],
              //* scrollable tabbar that contains months which filter the notes
              bottom: TabBar(isScrollable: true, tabs: [
                for (int i = 0; i < 12; i++) Tab(text: Months[i]),
              ]),
            ),
            body: TabBarView(
              //todo need to add mechanism that filters notes by month
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder(
                      future: HiveService.getAll(noteBox),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              heightFactor: 20,
                              child:
                                  CircularProgressIndicator()); // show a loading spinner while waiting
                        } else if (snapshot.hasError) {
                          return Text(
                              'Error: ${snapshot.error}'); // show an error message if something goes wrong
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Center(
                              heightFactor: 20,
                              child: Text('یادداشتی یافت نشد'));
                        } else {
                          print(snapshot.data);
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 20, right: 20),
                              child: ListView.builder(
                                // build a list view with the data
                                itemCount: snapshot.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TimelineIndicator(
                                          dayName: 's', dayNumber: 1),
                                      NoteCard(
                                          heightOfConnector: 180,
                                          describtionText:
                                              snapshot.data![index].description,
                                          titleText:
                                              snapshot.data![index].title),
                                    ],
                                  );
                                },
                              ),
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
                Text('2'),
                Text('3'),
                Text('4'),
                Text('5'),
                Text('6'),
                Text('7'),
                Text('8'),
                Text('9'),
                Text('10'),
                Text('11'),
                Text('12'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimelineConnector extends StatelessWidget {
  final double heightOfConnector;
  const TimelineConnector({
    Key? key,
    required this.heightOfConnector,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 17),
      width: 5,
      height: heightOfConnector,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
      ),
    );
  }
}

class TimelineIndicator extends StatelessWidget {
  final int dayNumber;
  final String dayName;
  const TimelineIndicator({
    Key? key,
    required this.dayName,
    required this.dayNumber,
  }) : super(key: key);
  //! temporary const files
  final String describtionTest =
      'این تست توضیحات میباشد لذا متن بلند تری برای آن در نظر گرفته شده چون توضیحات معمولا طولانی تر از عنوان یا بخش های دیگر هستند و نیاز به این دارند که آور فلوشان با توجه به اسکرین تنظیم شود';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //* circle avatar that contains day's number
        CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: Text(
            dayNumber.toString(),
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        //* text that contains day's name of the week and if is today then it shows 'امروز' and if it's yesterday then it shows 'دیروز'
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            dayName,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}

class NoteCard extends StatelessWidget {
  final double heightOfConnector;
  final String describtionText;
  final String titleText;
  NoteCard({
    required this.heightOfConnector,
    required this.describtionText,
    required this.titleText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SizedBox(
      height: 170,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimelineConnector(heightOfConnector: heightOfConnector),
          Padding(
            padding: EdgeInsets.only(right: 40, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //* NoteTitle
                Container(
                  width: mediaQuery.size.width * 0.74,
                  child: Text(
                    titleText,
                    style: Theme.of(context).textTheme.titleLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                //* NoteDescribtion
                Container(
                    padding: EdgeInsets.only(top: 10),
                    width: mediaQuery.size.width * 0.74,
                    child: Text(
                      describtionText,
                      softWrap: true,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
