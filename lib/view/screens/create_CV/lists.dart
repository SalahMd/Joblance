import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/create_CV_controller.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/date_picker.dart';

class CVLists extends StatelessWidget {
  final String title;
  final String textfieldTitle;
  final List list;
  final void Function() onAddTap;
  final bool withDate;
  final List? years;
  final List? dates;
  final CreateCVControllerImpl controller;

  const CVLists(
      {super.key,
      required this.title,
      required this.list,
      required this.onAddTap,
      required this.textfieldTitle,
      required this.controller,
      required this.withDate,
      this.dates,
      this.years});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey[300]),
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                right: 12.w, left: 12.w, top: 15.h, bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyles.w50015(context),
                ),
                GestureDetector(
                    onTap: onAddTap,
                    child: Icon(
                      Icons.add,
                      size: 20.sp,
                    ))
              ],
            ),
          ),
          ListView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, int index) {
                return !withDate
                    ? Customtextformfiled(
                        hintText:
                            textfieldTitle + " " + "${1 + index}".toString(),
                        labelText: "",
                        iconData: Icons.delete_outline,
                        ontapicon: () {
                          list.removeAt(index);
                          controller.update();
                        },
                        controller: list[index],
                        min: 2,
                        max: 30,
                        padding: 8,
                        isNumber: false,
                        isPassword: false,
                        isBorder: true,
                        isFilled: true,
                        isLabel: false,
                      ).animate().slideY(begin: -0.1, duration: 300.ms)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Customtextformfiled(
                            hintText: textfieldTitle +
                                " " +
                                "${1 + index}".toString(),
                            labelText: "",
                            iconData: Icons.delete_outline,
                            ontapicon: () {
                              list.removeAt(index);
                              controller.update();
                            },
                            controller: list[index],
                            min: 2,
                            max: 30,
                            padding: 8,
                            isNumber: false,
                            isPassword: false,
                            isBorder: true,
                            isFilled: true,
                            isLabel: false,
                          ).animate().slideY(begin: -0.1, duration: 300.ms),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              Container(
                                  width: 45.w,
                                  height: 45.h,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  child: Image.asset(AppImages.enterIcon)),
                              years == null
                                  ? GestureDetector(
                                      onTap: () async {
                                        dates![index] = await selectDate(
                                            context, DateTime(2030));
                                        controller.update();
                                      },
                                      child: Container(
                                              width: 250.w,
                                              height: 55.h,
                                              alignment: AlignmentDirectional
                                                  .centerStart,
                                              padding: EdgeInsetsDirectional
                                                  .symmetric(horizontal: 17.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primaryContainer),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      dates![index] != null
                                                          ? dates![index]
                                                          : "finish education date"
                                                              .tr,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Theme.of(
                                                                  context)
                                                              .colorScheme
                                                              .onSecondary)),
                                                  Icon(Icons
                                                      .calendar_month_outlined)
                                                ],
                                              ))
                                          .animate()
                                          .slideY(
                                              begin: -0.1, duration: 300.ms),
                                    )
                                  : Container(
                                      width: 250.w,
                                      child: Customtextformfiled(
                                        hintText: "yearsofexperience".tr,
                                        labelText: "",
                                        iconData: null,
                                        controller: years![index],
                                        min: 1,
                                        max: 4,
                                        padding: 8,
                                        isNumber: true,
                                        isPassword: false,
                                        isBorder: true,
                                        isFilled: true,
                                        isLabel: false,
                                      ).animate().slideY(
                                          begin: -0.1, duration: 300.ms),
                                    ),
                            ],
                          ),
                        ],
                      );
              }),
        ],
      ),
    );
  }
}
