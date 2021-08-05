import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/views/components/custom_widgets.dart';
import '../controller/jokes_controller.dart';

class JokeScreen extends GetView<JokeController> {
  const JokeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BoldTextWidget(title: "Jokes"),
        // Back button was being displayed even though not added
        automaticallyImplyLeading: false,
        actions: [
          Obx(() => controller.visible
              ? GestureDetector(
                  child: Icon(
                    Get.isDarkMode ? Icons.nightlight_round : Icons.wb_sunny_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                  onTapDown: (value) => {controller.changeTheme()},
                )
              : Container()),
          SizedBox(width: 10),
          // Hide Settings icon, when a Joke is being fetched.
          Obx(
            () => controller.visible
                ? PopupMenuButton(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Icon(
                        Icons.settings,
                        size: 25,
                      ),
                    ),
                    onSelected: popMenuItemAction,
                    offset: const Offset(0, 50),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("Categories"),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: Text("BlackList"),
                        value: 2,
                      ),
                      PopupMenuItem(
                        child: Text("READ.me"),
                        value: 3,
                      )
                    ],
                  )
                : Container(),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: GetX<JokeController>(
              builder: (controller) {
                return controller.state.when(
                  loading: () => CircularProgressIndicator(),
                  data: (joke) => joke!.type == "single" ? SingleJokeWidget(joke: joke) : TwoPartJokeWidget(joke: joke),
                  error: (error) => ErrorWithRetry(
                    errorMessage: error,
                    onPressed: () {
                      controller.fetchJoke();
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
      // Hide FAB, when a Joke is being fetched.
      floatingActionButton: Obx(
        () => controller.visible
            ? FloatingActionButton(
                child: Icon(Icons.refresh),
                onPressed: () {
                  controller.fetchJoke();
                },
              )
            : Container(),
      ),
    );
  }

  void popMenuItemAction(int index) {
    if (index == 1) {
      categoriesBottomSheet();
    } else if (index == 2) {
      blackListBottomSheet();
    } else {
      readMeDialog();
    }
  }

  void categoriesBottomSheet() {
    Get.bottomSheet(
      GenericBottomSheet(
          title: "Categories",
          items: controller.categories,
          pressed: (index, value) {
            controller.addOrRemoveCategory(index, value!);
          }),
      isDismissible: false,
      enableDrag: false,
    );
  }

  void blackListBottomSheet() {
    Get.bottomSheet(
      GenericBottomSheet(
          title: "Black List",
          items: controller.blackList,
          pressed: (index, value) {
            controller.addOrRemoveBlackList(index, value!);
          }),
      isDismissible: false,
      enableDrag: false,
    );
  }

  // The primary goal here is to learn Flutter & showcase the use of libraries used in the application.\n
  void readMeDialog() {
    Get.defaultDialog(
      title: "Greetings Everyone",
      titleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.blue),
      textCancel: "OK",
      content: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegularTextWidget(content: "This application is created to display \"Programming\" related jokes.\n"),
            RegularTextWidget(content: "In addition, it also has other jokes which are offensive\n."),
            RegularTextWidget(
                content: "The primary goal of this application is to learn Flutter & showcase the use of libraries used in the application.\n"),
            RegularTextWidget(content: "It is not the developer's intention to hurt feelings or cause discomfort to anyone.")
          ],
        ),
      ),
    );
  }
}
