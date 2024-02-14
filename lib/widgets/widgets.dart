import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String labelText;
  const MyTextFormField({
    required this.onSaved,
    required this.labelText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      expands: true,
      maxLines: null,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 35),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: FloatingLabelBehavior.always),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'لطفا این فیلد را پر کنید';
        } else {
          return null;
        }
      },
      onSaved: onSaved,
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
