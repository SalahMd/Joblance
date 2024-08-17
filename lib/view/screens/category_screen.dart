import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/category_controller.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/widgets/freelancer_design.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatelessWidget {
  final int id;
  final String name;

  CategoryScreen({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController(majorName: name));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                  child: Text(
                    name,
                    style: TextStyles.w50017(context),
                  )),
            ),
            Divider(
              thickness: 0.4,
              height: 1.h,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            GetBuilder<CategoryController>(
              builder: (controller) => ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: controller.freelancers.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return FreeLancerDesign(
                    name: controller.freelancers[index]['first_name'] +
                        " " +
                        controller.freelancers[index]['last_name'],
                    bio: controller.freelancers[index]['bio'],
                    location: controller.freelancers[index]['location'],
                    image: controller.freelancers[index]['image'],
                    major: controller.freelancers[index]['major']['name'],
                    openToWork: controller.freelancers[index]['open_to_work'],
                    id: controller.freelancers[index]['id'],
                    rateLevel: controller.freelancers[index]['rate'],
                    numOfRates: controller.freelancers[index]['counter'],
                    followers: controller.freelancers[index]['followers'],
                    onFavoriteTap: () {
                      controller.addToFavourite(
                          controller.freelancers[index]['id'], index);
                    },
                    isFavorite: controller.freelancers[index]['favourited'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
