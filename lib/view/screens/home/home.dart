// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_pad/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

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
                    icon: Icon(Icons.add,
                        color: Theme.of(context).iconTheme.color),
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
                      Text('1'),
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
                ],
              ),
            )),
      ),
    );
  }
}
