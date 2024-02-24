import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_pad/constants/constants.dart';

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
                      maxLines: 4,
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

class TimelineIndicator extends StatelessWidget {
  final Function()? onTap;
  final int dayNumber;
  final String dayName;
  const TimelineIndicator({
    Key? key,
    this.onTap,
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
        SizedBox(width: 150),
        InkWell(
          onTap: onTap,
          child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.red[300],
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(
                CupertinoIcons.delete,
                color: Colors.white,
              )),
        )
      ],
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

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 200),
          Center(
            child: Container(
                width: 300,
                child: Lottie.asset('assets/animations/emptyState.json')),
          ),
          const SizedBox(height: 20),
          Text(
            'هنوز یادداشتی، وارد نشده!',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
