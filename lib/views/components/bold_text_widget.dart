import 'package:flutter/material.dart';

class BoldTextWidget extends StatelessWidget {
  const BoldTextWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    );
  }
}