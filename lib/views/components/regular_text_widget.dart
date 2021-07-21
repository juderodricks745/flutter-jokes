import 'package:flutter/material.dart';

class RegularTextWidget extends StatelessWidget {
  RegularTextWidget({Key? key, required this.content}) : super(key: key);

  String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.left,
    );
  }
}
