import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/widgets/divider.dart';

class ReviewDesign extends StatelessWidget {
  final String image;
  final String review;
  final String name;
  final String date;
  final level;
  final String userId;
  const ReviewDesign(
      {super.key,
      required this.image,
      required this.review,
      required this.name,
      required this.level,
      required this.date,
      required this.userId});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth(context),
      //height: 180.h,
      padding: EdgeInsets.symmetric(vertical: 5.h),
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32.sp,
                height: 32.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    image[0] == "h" ? image : AppLinks.IP + image,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 100.w,
                  //height: 40.h,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: RatingBar.builder(
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      ignoreGestures: true,
                      itemCount: 5,
                      unratedColor: LightAppColors.greyColor,
                      initialRating: level.toDouble(),
                      itemSize: 20,
                      itemBuilder: (context, index) {
                        return Icon(
                          Icons.star,
                          size: 10.sp,
                          color: Colors.yellow[700],
                        );
                      },
                      onRatingUpdate: (rate) {})),
              Text(
                Jiffy.parse(date).format(pattern: "h:mm a"),
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
          ),
          MyDivider()
        ],
      ),
    );
  }
}
