import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/controller/jokes_controller.dart';
import 'package:jokes_app/model/data_item.dart';

import 'bold_text_widget.dart';
import 'button_event_widget.dart';

class GenericBottomSheet extends StatelessWidget {
  GenericBottomSheet({Key? key, required this.title, required this.items, required this.pressed}) : super(key: key);

  final String title;
  final List<DataItem> items;
  final Function(int, bool?) pressed;

  @override
  Widget build(BuildContext context) {
    JokeController controller = Get.find();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: context.theme.backgroundColor
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BoldTextWidget(title: title),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final category = items[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            value: category.isChecked.value,
                            onChanged: (value) {
                              pressed(category.id, value);
                            },
                          ),
                        ),
                        Text(
                          category.title,
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            ButtonWithEvent(
                title: "Apply Now",
                press: () {
                  Get.back();
                  controller.fetchJoke();
                }),
            SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}
