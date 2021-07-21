import 'package:flutter/material.dart';

class ButtonWithEvent extends StatelessWidget {
  const ButtonWithEvent({
    Key? key, required this.title, required this.press
  }) : super(key: key);

  final String title;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius:
              const BorderRadius.all(Radius.circular(20))),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
        ),
        onPressed: press);
  }
}