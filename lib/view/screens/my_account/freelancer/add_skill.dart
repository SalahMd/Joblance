import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/my_account_controller/my_account_free_lancer_controller.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/widgets/divider.dart';

class AddSkill extends StatelessWidget {
  final MyAccountFreelancerControllerImpl controller;
  const AddSkill({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<MyAccountFreelancerControllerImpl>(
          builder: (controller) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
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
                      "addskill".tr,
                      style: TextStyles.w50019(context),
                    ),
                  ],
                ),
              )),
              SizedBox(height: 20.h),
              TextFormField(
                controller: controller.skill,
                onChanged: (s) {
                  controller.searchSkill();
                },
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // FocusScope.of(context).unfocus();
                      controller.searchSkill();
                    },
                    child: Container(
                      child: Icon(
                        Icons.search,
                        size: 25,
                      ),
                    ),
                  ),
                  enabled: true,
                  hintText: "addyourskill".tr,
                  hintStyle: const TextStyle(fontSize: 17),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.only(
                      left: 15.w, right: 5.w, top: 15.h, bottom: 15.h),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: Dimensions.screenWidth(context),
                height: 500.h,
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                child: ListView.builder(
                    itemCount: controller.skills.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    // physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller
                                  .addSkill(controller.skills[index]['id'],context);
                            },
                            child: Text(
                              controller.skills[index]['name'],
                              style: TextStyles.w50012(context),
                            ),
                          ),
                          MyDivider(
                            height: 10,
                          )
                        ],
                      );
                    }),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                //bottom: 1,
                child: Container(
                  width: Dimensions.screenWidth(context),
                  height: 40.h,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  decoration: AppButtons.buttonDecoration,
                  child: Text(
                    "save".tr,
                    style: TextStyles.w50016White(context),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
