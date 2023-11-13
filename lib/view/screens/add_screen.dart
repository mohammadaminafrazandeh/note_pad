import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'اضافه کردن یادداشت',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(label: const Text('عنوان')),
                ),
                SizedBox(height: 25),
                TextFormField(
                    decoration: InputDecoration(label: const Text('توضیحات'))),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      child: const Text('ذخیره'),
                      onPressed: () {},
                    ),
                    ElevatedButton(
                      child: const Text('انصراف'),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
