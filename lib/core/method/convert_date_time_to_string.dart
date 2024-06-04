import 'package:intl/intl.dart';

String convertDateTimeToString(DateTime now) {
  final result =
      '${DateFormat.yMMMMd().format(now)} ${DateFormat.Hm().format(now)}';
  return result;
}
