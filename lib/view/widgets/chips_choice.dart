import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChipsChoices extends StatelessWidget {
  List<String> tags = [];
  final List<String> options;

  ChipsChoices({super.key, required this.options});
  @override
  Widget build(BuildContext context) {
    return Scaffold();
    // Get.put(SearchControllerImpl());
    // return GetBuilder<SearchControllerImpl>(
    //   builder: (controller) => ChipsChoice<String>.multiple(
    //     value: tags,
    //     choiceStyle: C2ChipStyle(
    //       foregroundStyle: TextStyle(color: Colors.blue[700]),
    //     ),
    //     onChanged: (List<String> value) {
    //       tags = value;
    //       print(value);
    //       controller.update();
    //     },
    //     choiceItems: C2Choice.listFrom(
    //         source: options, value: (i, v) => v, label: (i, v) => v),
    //   ),
    // );
  }
}
