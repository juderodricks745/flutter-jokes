import 'package:freezed_annotation/freezed_annotation.dart';

import 'joke.dart';
part 'joke_state.freezed.dart';

@freezed
abstract class JokeState with _$JokeState {
  const factory JokeState.loading() = _Loading;
  const factory JokeState.data(Joke? joke) = _Data;
  const factory JokeState.error(String error) = _Error;
}