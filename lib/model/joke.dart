import 'dart:convert';

class Joke {
  Joke({
    this.type,
    this.joke,
    this.setup,
    this.delivery,
  });

  String? type;
  String? joke;
  String? setup;
  String? delivery;

  factory Joke.fromJson(String str) => Joke.fromMap(json.decode(str));

  factory Joke.fromMap(Map<String, dynamic> json) => Joke(
    type: json["type"],
    joke: json["joke"],
    setup: json["setup"],
    delivery: json["delivery"],
  );
}