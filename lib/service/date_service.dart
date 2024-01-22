import 'package:note_pad/constants/constants.dart';
import 'package:note_pad/service/HiveService.dart';
import 'package:shamsi_date/shamsi_date.dart';

Future getMonthList() async {
  List<int> monthList = [];
  var box = await HiveService.openBox(noteBox);
  box.values.toList().forEach(
    (element) {
      var gregorianDate = DateTime.parse(element.createdAt);
      var jalaliDate = Jalali.fromDateTime(gregorianDate);
      monthList.add(jalaliDate.month);
    },
  );
  print("this is the month list $monthList");
  return monthList;
}
