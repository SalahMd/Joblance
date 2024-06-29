import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/search_controller.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/search/filters.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchControllerImpl());
    return GetBuilder<SearchControllerImpl>(
      builder: (controller) => Scaffold(
          body: Column(children: [
        SafeArea(
          child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              width: Dimensions.screenWidth(context),
              height: 60,
              child: TextFormField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(),
                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.search,
                      size: 25,
                    ),
                  ),
                  prefixIcon: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 25,
                    ),
                  ),
                  enabled: true,
                  hintText: "search".tr,
                  hintStyle: const TextStyle(fontSize: 17),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: const EdgeInsets.only(
                      left: 20, right: 5, top: 15, bottom: 15),
                ),
              )),
        ),
         Filters(controller:controller,)
      ])),
    );
  }
}
