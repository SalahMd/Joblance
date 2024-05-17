import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class StatusScreen extends StatelessWidget {
  final StatusRequest? statusRequest;
  const StatusScreen({super.key, required this.statusRequest});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.screenHeight(context),
      width: Dimensions.screenWidth(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 150.w,
            height: 150.h,
            alignment: Alignment.center,
            child: statusRequest == StatusRequest.offline
                ? AppAnimations.noInternet
                : statusRequest == StatusRequest.serverError
                    ? AppAnimations.serverError
                    : null,
          ),
          SizedBox(
            height: 10.h,
          ),
          statusRequest == StatusRequest.offline
              ? Text("nointernetconnection".tr)
              : Text("servererror".tr)
        ],
      ),
    );
  }
}
