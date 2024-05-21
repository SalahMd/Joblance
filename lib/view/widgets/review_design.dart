import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class ReviewDesign extends StatelessWidget {
  final String image;
  final String review;
  final String name;
  final String date;
  final int level;
  const ReviewDesign(
      {super.key,
      required this.image,
      required this.review,
      required this.name,
      required this.level,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth(context),
      height: 200.h,
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 35.sp,
                height: 35.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    image[0] == "h" ? image : AppLinks.IP + "/" + image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                name,
                style: TextStyles.w50014(context),
              ),
            ],
          ),
          SizedBox(height: 3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 100.w,
                  height: 40.h,
                  child: ListView.builder(
                    itemCount: level,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                        size: 17.sp,
                      );
                    },
                  )),
              Text(
                date,
                style: TextStyles.w40012grey(context),
              )
            ],
          ),
          SizedBox(height: 3.h),
          Row(
            children: [
              Expanded(
                  child: Text(
                review,
                style: TextStyles.w40013grey(context),
                maxLines: 3,
              )),
            ],
          )
        ],
      ),
    );
  }
}
