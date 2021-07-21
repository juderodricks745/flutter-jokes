import 'package:get/get.dart';

class DataItem {
  int id;
  String title;
  String tag;
  RxBool isChecked;

  DataItem({required this.id, required this.title, required this.tag, required this.isChecked});
}