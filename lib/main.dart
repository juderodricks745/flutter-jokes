import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/views/joke_screen.dart';
import 'binding/joke_binding.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Jokes',
      debugShowCheckedModeBanner: false,
      home: JokeScreen(),
      initialRoute: "/jokeHome",
      initialBinding: JokeBinding(),
      getPages: [
        GetPage(
          name: "/jokeHome",
          page: () => JokeScreen(),
          binding: JokeBinding(),
        )
      ],
    );
  }
}
