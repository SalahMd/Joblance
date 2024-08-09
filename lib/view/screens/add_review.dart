import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/add_review_controller.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class AddReview extends StatelessWidget {
  final String image;
  final String name;
  final int id;
  const AddReview(
      {super.key, required this.image, required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    Get.put(AddReviewControllerImpl(id: id));
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<AddReviewControllerImpl>(
          builder: (controller) => Form(
            key: controller.formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                SafeArea(
                    child: Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 22.sp,
                        )),
                    SizedBox(
                      width: 15.w,
                    ),
                    Container(
                      width: 40.w,
                      height: 40.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          image[0] == "h" ? image : AppLinks.IP + image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyles.w50014(context),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "ratethiscompany".tr,
                          style: TextStyles.w50013(context),
                        ),
                      ],
                    )
                  ],
                )),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    "thisreviewispublic".tr,
                    style: TextStyles.w40014grey(context),
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Container(
                      width: 175.w,
                      alignment: Alignment.center,
                      height: 60.h,
                      child: RatingBar.builder(
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          initialRating: 4,
                          itemCount: 5,
                          unratedColor: LightAppColors.greyColor,
                          itemBuilder: (context, index) {
                            return Icon(
                              Icons.star,
                              size: 35.sp,
                              color: Colors.yellow[700],
                            );
                          },
                          onRatingUpdate: (rate) {
                            controller.level = rate;
                          })),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Customtextformfiled(
                  hintText: "review".tr,
                  labelText: "",
                  iconData: null,
                  controller: controller.review,
                  min: 1,
                  max: 250,
                  letters: 250,
                  textInputAction: TextInputAction.newline,
                  isNumber: false,
                  isPassword: false,
                  maxLines: 4,
                  isBorder: true,
                  isLabel: false,
                  isFilled: true,
                ),
                SizedBox(
                  height: 30.h,
                ),
                GestureDetector(
                  onTap: () {
                    controller.postReview(context);
                  },
                  child: Container(
                    width: Dimensions.screenWidth(context),
                    height: 40.h,
                    alignment: Alignment.center,
                    margin:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 40.h),
                    decoration: AppButtons.buttonDecoration,
                    child: Text(
                      "postreview".tr,
                      style: TextStyles.w50016White(context),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
