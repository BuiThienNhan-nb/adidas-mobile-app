import 'package:intl/intl.dart';

class AppFormat {
  static DateFormat formatDay = DateFormat('dd/MM/yyyy');
  static DateFormat formatTime = DateFormat('HH:mm');
  static DateFormat formatDateTime = DateFormat('dd/MM/yyyy -- HH:mm');
  static DateFormat formatTimeAndDate = DateFormat('HH:mm MM/dd');
  static DateFormat formatDateMonthTime = DateFormat('dd MMM yyyy, HH:mm');

  static final currencyFormat = NumberFormat("#,##0", "en_US");
}
