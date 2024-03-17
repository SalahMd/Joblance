import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_launcher_icons/config/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/widgets/divider.dart';

class TextingPage extends StatelessWidget {
  TextEditingController controller = new TextEditingController();
  TextingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Dimensions.screenHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(children: [
                SizedBox(
                  height: 10.h,
                ),
                SafeArea(
                    child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back)),
                    SizedBox(width: 8.w),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(AppImages.Linkedin),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Linkedin",
                      style: TextStyles.w50014(context),
                    ),
                  ],
                )),
                MyDivider(
                  height: 12,
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Customtextformfiled(
                hinttext: "message".tr,
                labelText: "",
                icondata: Icons.send_outlined,
                controller: controller,
                min: 0,
                max: 100,
                isnumber: false,
                ispassword: false,
                isBorder: true,
                isLabel: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
