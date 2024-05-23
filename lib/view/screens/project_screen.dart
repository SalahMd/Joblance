import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/project_or_product_controller.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/widgets/divider.dart';

class ProjectScreen extends StatelessWidget {
  final int projectId;
  final int userId;
  const ProjectScreen({
    super.key,
    required this.userId,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ProjectScreenControllerImpl(id: userId, projectId: projectId,context));
    return Scaffold(
      body: GetBuilder<ProjectScreenControllerImpl>(
        builder: (controller) => SingleChildScrollView(
          child: controller.statusRequest == StatusRequest.loading
              ? Container()
              : Form(
                  key: controller.formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: SafeArea(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(Icons.arrow_back)),
                                SizedBox(width: 10.w),
                                Text(
                                    !controller.isProduct
                                        ? "project".tr
                                        : "product".tr,
                                    style: TextStyles.w50018(context)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Visibility(
                                    visible: controller.isOwner,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller.isEditing =
                                                !controller.isEditing;
                                            controller.update();
                                          },
                                          child: Visibility(
                                            visible: !controller.isEditing,
                                            child: Icon(
                                              Icons.edit,
                                              color:
                                                  LightAppColors.primaryColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            animationedAlertWithActions(
                                                AppAnimations.info,
                                                "doyoureallywanttodelete".tr,
                                                controller.deleteData);
                                            controller.update();
                                          },
                                          child: Icon(
                                            Icons.delete_outline,
                                            color: Colors.red[800],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        )
                                      ],
                                    ))
                              ],
                            )
                          ],
                        )),
                      ),
                      SizedBox(height: 30.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          "title".tr,
                          style: TextStyles.w50014(context),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Customtextformfiled(
                        hintText: "",
                        labelText: "".tr,
                        iconData: null,
                        controller: controller.title,
                        min: 2,
                        max: 25,
                        maxLines: 3,
                        minLines: 1,
                        styleText: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp),
                        isNumber: false,
                        isPassword: false,
                        isEnabled: controller.isEditing,
                        padding: 1,
                        isBorder: false,
                        isLabel: false,
                        isFilled: controller.isEditing,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      MyDivider(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          "link".tr,
                          style: TextStyles.w50014(context),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Customtextformfiled(
                        hintText: "",
                        labelText: "".tr,
                        iconData: null,
                        controller: controller.link,
                        min: 10,
                        max: 100,
                        maxLines: 8,
                        minLines: 1,
                        isNumber: false,
                        styleText: TextStyle(
                          color: Colors.blue[700],
                          fontSize: 12.sp,
                        ),
                        isEnabled: controller.isEditing,
                        isPassword: false,
                        padding: 1,
                        isBorder: false,
                        isLabel: false,
                        isFilled: controller.isEditing,
                      ),
                      SizedBox(height: 10.h),
                      MyDivider(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          "description".tr,
                          style: TextStyles.w50014(context),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Expanded(
                              child: Customtextformfiled(
                            hintText: "".tr,
                            labelText: "",
                            iconData: null,
                            controller: controller.description,
                            min: 5,
                            max: 250,
                            isNumber: false,
                            isPassword: false,
                            maxLines: 8,
                            isEnabled: controller.isEditing,
                            styleText: TextStyle(
                                color: LightAppColors.greyColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp),
                            minLines: 1,
                            isBorder: false,
                            isLabel: false,
                            isFilled: controller.isEditing,
                            padding: 0,
                          )),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      MyDivider(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "images".tr,
                              style: TextStyles.w50014(context),
                            ),
                            Visibility(
                                visible: controller.isEditing,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.pickImage();
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 20.sp,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GridView.builder(
                          padding: EdgeInsets.only(bottom: 20.h),
                          itemCount: controller.images.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return controller.isEditing
                                ? Stack(
                                    children: [
                                      Container(
                                        width:
                                            Dimensions.screenWidth(context) / 2,
                                        height: 330.h,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20.h, vertical: 15.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: controller.images[index].keys
                                                      .last ==
                                                  "device"
                                              ? Image.file(
                                                  File(controller.images[index]
                                                      .values.last.path),
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.network(
                                                  AppLinks.IP +
                                                      
                                                      controller.images[index]
                                                          .values.last,
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      ),
                                      PositionedDirectional(
                                        start: 20.w,
                                        top: 15.h,
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.removeImage(index,controller.imagesId[index]);
                                          },
                                          child: Container(
                                            width: 35,
                                            height: 35,
                                            child: Icon(
                                              Icons.highlight_remove_outlined,
                                              color: Colors.red[800],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 10.h),
                                    height: 200.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        AppLinks.IP +
                                            
                                            controller
                                                .images[index].values.last,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                          }),
                      Visibility(
                        visible: controller.isEditing,
                        child: GestureDetector(
                          onTap: () {
                            controller.updateProject();
                          },
                          child: Container(
                            width: Dimensions.screenWidth(context),
                            height: 40.h,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: 30.w, vertical: 20.h),
                            decoration: AppButtons.buttonDecoration,
                            child: Text(
                              "save".tr,
                              style: TextStyles.w50016White(context),
                            ),
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
