import 'package:intl/intl.dart';
String? parceDate(String? date){
  if(date==null)return date;
  final DateTime dateTime=DateTime.parse(date).toLocal();
  final String formatted=DateFormat('d MMMM HH:mm','ru').format(dateTime);
  return formatted;
}