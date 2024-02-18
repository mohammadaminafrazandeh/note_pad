// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_pad/constants/constants.dart';
import 'package:note_pad/data/model/note_model.dart';
import 'package:note_pad/repo/repository.dart';
import 'package:note_pad/widgets/widgets.dart';
import 'package:provider/provider.dart';

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
            body: Column(
              children: [
                EmptyWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
