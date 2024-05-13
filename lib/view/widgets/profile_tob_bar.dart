import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/image_view.dart';

class TobBar extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final bool isMyAccount;

  TobBar({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    this.isMyAccount = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: Dimensions.screenWidth(context),
              height: 180.h,
              color: Colors.grey,
              child: Image.asset(
                AppImages.joblance,
                fit: BoxFit.fill,
              ),
            ),
            Visibility(
              visible: !isMyAccount,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SafeArea(
                  child: Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(ImageView(image: image));
              },
              child: Container(
                width: 120,
                height: 120,
                alignment: Alignment.center,
                margin: EdgeInsetsDirectional.only(start: 5.w, top: 125.h),
                decoration: BoxDecoration(
                  border: Border.all(color: LightAppColors.whiteColor),
                  color: LightAppColors.greyColor,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: image != ""
                        ? Image.network(
                            image[0] == "h" ? image : AppLinks.IP + "/" + image,
                            fit: BoxFit.cover,
                            width: 120,
                            height: 120,
                          )
                        : Container()),
              ),
            ),
          ],
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    name,
                    style: TextStyles.w50017(context),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    description,
                    style: TextStyles.w50012(context),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "10 M Followers",
                    style: TextStyles.w40012grey(context),
                  ),
                ])),
      ],
    );
  }
}
