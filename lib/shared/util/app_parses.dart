import 'package:intl/intl.dart';

class AppParses {
  static String weekDay(DateTime date) =>
      DateFormat('EEE').format(date).toUpperCase();
  static String dayMonth(DateTime date) => DateFormat('dd/MM').format(date);
  static String dayMonthYear(DateTime date) =>
      DateFormat('dd/MM/yy').format(date);
  static String hour(DateTime date) => DateFormat('kk:mm').format(date);
}
