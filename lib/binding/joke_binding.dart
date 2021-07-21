import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:http/http.dart' as http;
import 'package:jokes_app/controller/jokes_controller.dart';
import 'package:jokes_app/data/joke_client.dart';

class JokeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JokeController>(
      () => JokeController(
        client: JokeClient(
          httpClient: http.Client(),
        ),
      ),
    );
  }
}
