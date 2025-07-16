import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class TaskOfferWidget extends StatelessWidget {
  final String userName;
  final String userImage;
  final String majorName;
  final String offerInfo;
  final String budget;
  final String excutingTime;
  final String datePosted;
  final void Function()? onAccepted;
  const TaskOfferWidget(
      {super.key,
      required this.userName,
      required this.userImage,
      required this.majorName,
      required this.offerInfo,
      required this.budget,
      required this.excutingTime,
      required this.datePosted,
      required this.onAccepted});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth(context),
      //height: 180.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            AppLinks.IP + userImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                userName,
                                style: TextStyles.w50014(context),
                              ),
                            ],
                          ),
                          Text(
                            majorName,
                            style: TextStyles.w40011grey(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        size: 12.sp,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(Jiffy.parse(datePosted).from(Jiffy.now()).toString(),
                          style: TextStyles.w40011grey(context)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money_outlined,
                        size: 12.sp,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(budget, style: TextStyles.w40011grey(context)),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: Icon(
                  Icons.delete_outline,
                  size: 20.sp,
                  color: Colors.red[800],
                ),
              )
            ]),
        SizedBox(
          height: 5.h,
        ),
        Text("offerinfo".tr, style: TextStyles.w40011(context)),
        Text(offerInfo,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.w40011grey(context)),
        onAccepted != null
            ? GestureDetector(
                onTap: () {
                  onAccepted!();
                },
                child: Center(
                  child: Container(
                    width: 100.w,
                    height: 30.h,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 15.h, bottom: 5.h),
                    decoration: BoxDecoration(
                        color: LightAppColors.greenColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "accept".tr,
                      style: TextStyles.w50013White(context),
                    ),
                  ),
                ),
              )
            : Container()
      ]),
    );
  }
}
