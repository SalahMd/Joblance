import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/home_page/freelancer_home_page/slider.dart';

class Swiper extends StatelessWidget {
  const Swiper({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.screenWidth(context),
      height: 190.h,
      child: CarouselSlider(
        items: [
          SliderWidget(
            companyImage: AppImages.Linkedin,
            companyName: 'Linkedin',
            applicants: '100',
            jobTitle: 'React developer',
            remote: 'remote'.tr,
          ),
          SliderWidget(
            companyImage: AppImages.google,
            companyName: 'Google',
            applicants: '80',
            jobTitle: 'Grapghic designer',
            remote: 'onsite'.tr,
          ),
          SliderWidget(
            companyImage: AppImages.googleLogo,
            companyName: 'Google',
            applicants: '75',
            jobTitle: 'Flutter developer',
            remote: 'hybrid'.tr,
          ),
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
