import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_pad/view/constants/constants.dart';

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
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  context.push('/addscreen'); //! route to add_screen.dart
                },
                child: Icon(Icons.add)),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterFloat,
            body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 30,
                // crossAxisSpacing: 0,
              ),
              padding: const EdgeInsets.all(50.0),
              itemCount: 30,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    GestureDetector(
                      onLongPress: () {
                        context.push('/addscreen');
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
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    'عنوان',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی،و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete),
                        style: ElevatedButton.styleFrom()),
                  ],
                );
              },
            )));
  }
}
