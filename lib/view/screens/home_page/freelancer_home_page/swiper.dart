import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:joblance/controller/freelancer_home_page_controller.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/home_page/freelancer_home_page/slider.dart';

class Swiper extends StatelessWidget {
  final FreelancerHomePageControllerImpl controller;
  const Swiper({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.screenWidth(context),
      height: 195,
      child: CarouselSlider(
        items: [
          ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              //scrollDirection: Axis.horizontal,
              itemCount:
                  controller.jobs.length <= 5 ? controller.jobs.length : 5,
              itemBuilder: (context, index) {
                return SliderWidget(
                  id: controller.jobs[index].id!,
                  companyImage: controller.jobs[index].companyImage!,
                  companyName: controller.jobs[index].companyName!,
                  major: controller.jobs[index].mojorName!,
                  jobTitle: controller.jobs[index].jobTitle!,
                  remote: controller.jobs[index].remoteName!,
                  date: controller.jobs[index].date!,
                  jobExperience: controller.jobs[index].experienceLevelName!,
                );
              })
          //   SliderWidget(
          //     companyImage: controller.jobs[0].companyImage!,
          //     companyName: controller.jobs[0].companyName!,
          //     major: controller.jobs[0].mojorName!,
          //     jobTitle: controller.jobs[0].jobTitle!,
          //     remote: controller.jobs[0].remoteName!,
          //     date: controller.jobs[0].jobTypeName!,
          //     jobExperience: controller.jobs[0].experienceLevelName!,
          //   ),
          //   SliderWidget(
          //  companyImage: controller.jobs[1].companyImage!,
          //     companyName: controller.jobs[1].companyName!,
          //     major: controller.jobs[1].mojorName!,
          //     jobTitle: controller.jobs[1].jobTitle!,
          //     remote: controller.jobs[1].remoteName!,
          //      date: controller.jobs[1].jobTypeName!,
          //     jobExperience: controller.jobs[1].experienceLevelName!,
          //   ),
          //   SliderWidget(
          //     companyImage: controller.jobs[2].companyImage!,
          //     companyName: controller.jobs[2].companyName!,
          //     major: controller.jobs[2].mojorName!,
          //     jobTitle: controller.jobs[2].jobTitle!,
          //     remote: controller.jobs[2].remoteName!,
          //      date: controller.jobs[2].jobTypeName!,
          //     jobExperience: controller.jobs[2].experienceLevelName!,
          //   ),
        ],
        options: CarouselOptions(
          autoPlay: true,
          enlargeFactor: 0.4,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
          viewportFraction: 1,
          autoPlayInterval: const Duration(seconds: 3),
          aspectRatio: 1.2,
          initialPage: 0,
        ),
      ),
    );
  }
}
