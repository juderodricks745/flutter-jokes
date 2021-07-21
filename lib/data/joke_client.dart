import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:jokes_app/model/joke.dart';

import 'joke_exception.dart';

class JokeClient {
  final http.Client httpClient;

  JokeClient({required this.httpClient});

  Future<dynamic> getJoke(String category, String blackList) async {
    try {
      String properUrl = "https://v2.jokeapi.dev/joke/$category";
      if (blackList.isNotEmpty) {
        properUrl = "https://v2.jokeapi.dev/joke/$category?blacklistFlags=$blackList";
      }
      log("Url => $properUrl");
      var response = await httpClient.get(Uri.parse(properUrl));
      return Joke.fromJson(response.body);
    } on SocketException catch (e) {
      return JokesException(e.message);
    }
  }
}