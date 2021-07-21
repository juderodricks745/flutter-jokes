import 'dart:core';

import 'package:get/get.dart';
import 'package:jokes_app/controller/constants.dart';
import 'package:jokes_app/data/joke_client.dart';
import 'package:jokes_app/data/joke_exception.dart';
import 'package:jokes_app/model/data_item.dart';
import 'package:jokes_app/model/joke.dart';
import 'package:jokes_app/model/joke_state.dart';

class JokeController extends GetxController {
  JokeController({required this.client});

  final JokeClient client;

  final _state = JokeState.loading().obs;

  JokeState get state => _state.value;

  // Categories
  RxList<DataItem> _categories = <DataItem>[].obs;

  List<DataItem> get categories {
    return [..._categories];
  }

  // Black List
  RxList<DataItem> _blackList = <DataItem>[].obs;

  List<DataItem> get blackList {
    return [..._blackList];
  }

  RxBool _visible = true.obs;

  bool get visible => _visible.value;

  @override
  void onInit() {
    createBlackList();
    createCategories();
    fetchJoke();
    super.onInit();
  }

  void createBlackList() {
    _blackList.value = Constants.blackList.mapIndexed((item, index) => DataItem(
          id: index,
          title: item,
          tag: item.toLowerCase(),
          isChecked: true.obs,
        ));
  }

  void addOrRemoveBlackList(int id, bool value) {
    final int index = _blackList.indexWhere((item) => item.id == id);
    _blackList[index].isChecked.value = value;
  }

  void createCategories() {
    _categories.value = Constants.categories.mapIndexed((item, index) => DataItem(
          id: index,
          title: item,
          tag: item.toLowerCase(),
          isChecked: (index == 0).obs,
        ));
  }

  void addOrRemoveCategory(int id, bool value) {
    final int index = _categories.indexWhere((item) => item.id == id);
    _categories[index].isChecked.value = value;
  }

  void fetchJoke() async {
    String blackList = _blackList.value.where((item) => item.isChecked.value).map((item) => item.tag).toList().join(",");
    List<String> categories = _categories.value.where((item) => item.isChecked.value).map((item) => item.title).toList();
    String category = categories.length != 0 ? categories.join(",") : "Any";
    _visible.value = false;
    _state.value = JokeState.loading();
    var response = await client.getJoke(category, blackList);
    if (response is Joke?) {
      _visible.value = true;
      _state.value = JokeState.data(response);
    } else if (response is JokesException) {
      _visible.value = false;
      _state.value = JokeState.error(response.message);
    }
  }
}

extension MapWithIndex<T> on List<T> {
  List<R> mapIndexed<R>(R Function(T, int i) callback) {
    List<R> result = [];
    for (int i = 0; i < this.length; i++) {
      R item = callback(this[i], i);
      result.add(item);
    }
    return result;
  }
}
