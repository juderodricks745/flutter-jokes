import 'package:flutter/material.dart';
import 'package:jokes_app/model/joke.dart';

class SingleJokeWidget extends StatelessWidget {
  const SingleJokeWidget({Key? key, required this.joke}) : super(key: key);

  final Joke? joke;

  @override
  Widget build(BuildContext context) {
    return Text(
      joke!.joke!,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.justify,
    );
  }
}
