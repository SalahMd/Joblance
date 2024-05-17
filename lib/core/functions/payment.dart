import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/paypal.dart';
import 'package:joblance/view/widgets/divider.dart';

payment(BuildContext context, String amount) {
  Get.bottomSheet(Container(
      width: Dimensions.screenWidth(context),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 50.w,
                height: 5.h,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: LightAppColors.greyColor,
                    borderRadius: BorderRadius.circular(50)),
              ),
            )),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w),
          child: Text(
            "Select your payment method".tr,
            style: TextStyles.w50014(context),
          ),
        ),
        SizedBox(height: 30.h),
        GestureDetector(
          onTap: () async {
            Get.to(PayPalCheck());
          },
          child: Container(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 15.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Paypal", style: TextStyles.w50013(context)),
                Container(
                  width: 25.w,
                  height: 35.h,
                  child: Image.asset(
                    AppImages.paypalLogo,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
        MyDivider(
          height: 2,
        ),
        Container(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 15.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("My budget", style: TextStyles.w50013(context)),
              Container(
                  width: 25.w,
                  height: 25.h,
                  child: Icon(
                    Icons.payment,
                    color: Colors.blue[900],
                    size: 25.sp,
                  )),
            ],
          ),
        ),
        SizedBox(height: 20.h),
      ]))));
}
