import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/settings_controller/edit_profile_controller.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/edit_profile/profile_drop_down_widget.dart';
import 'package:joblance/view/screens/edit_profile/profile_text_fields.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileControllerImpl(context: context));
    return Scaffold(
      body: GetBuilder<EditProfileControllerImpl>(
        builder: (controller) => SingleChildScrollView(
          child: controller.statusRequest == StatusRequest.loading
              ? Container()
              : Form(
                  key: controller.formState,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      SafeArea(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(Icons.arrow_back)),
                            SizedBox(width: 10.w),
                            Text(
                              "editprofile".tr,
                              style: TextStyles.w50019(context),
                            ),
                          ],
                        ),
                      )),
                      SizedBox(
                        height: 30.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.pickImage();
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(70)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(79),
                                  child: controller.newImage == null
                                      ? Image.network(
                                          controller.image![0] != "h"
                                              ? AppLinks.IP + controller.image!
                                              : controller.image!,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.file(
                                          File(controller.newImage.path),
                                          fit: BoxFit.cover,
                                        )),
                            ),
                            PositionedDirectional(
                                bottom: 5.h,
                                end: 5.w,
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Icon(
                                    Icons.edit_outlined,
                                    size: 18.sp,
                                    color: LightAppColors.primaryColor,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),
                      ProfileTextField(controller: controller),
                      ProfileDropDownWidget(
                          title: "major",
                          choices: controller.majors,
                          elementValue: controller.major,
                          controller: controller),
                      SizedBox(
                        height: 5.h,
                      ),
                      Visibility(
                        visible: controller.isFreelancer,
                        child: ProfileDropDownWidget(
                            title: "study",
                            choices: controller.studyCases,
                            elementValue: controller.studyCase,
                            controller: controller),
                      ),
                      Visibility(
                        visible: controller.isFreelancer,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer),
                          margin: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 15.h),
                          padding: EdgeInsetsDirectional.only(
                              start: 20.w, top: 5.h, bottom: 5.h, end: 5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "opentowork".tr,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Checkbox(
                                  activeColor: LightAppColors.greenColor,
                                  checkColor: LightAppColors.primaryColor,
                                  value: controller.openToWork,
                                  onChanged: (val) {
                                    controller.changeOpenToWork();
                                  }),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      GestureDetector(
                        onTap: () {
                          controller.updateUserData();
                        },
                        child: Container(
                          width: Dimensions.screenWidth(context),
                          height: 40.h,
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                              horizontal: 40.w, vertical: 40.h),
                          decoration: AppButtons.buttonDecoration,
                          child: Text(
                            "savechanges".tr,
                            style: TextStyles.w50016White(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
