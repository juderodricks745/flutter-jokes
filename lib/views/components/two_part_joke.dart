import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:jokes_app/model/joke.dart';

class TwoPartJokeWidget extends StatelessWidget {
  TwoPartJokeWidget({Key? key, required this.joke}) : super(key: key);

  final Joke? joke;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          joke!.setup!,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20),
        DelayedWidget(
          key: UniqueKey(), // Forces a Widget to be redrawn
          delayDuration: Duration(seconds: 1),
          animationDuration: Duration(milliseconds: 500),
          animation: DelayedAnimations.SLIDE_FROM_LEFT,
          child: Text(
            joke!.delivery!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.amber),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
