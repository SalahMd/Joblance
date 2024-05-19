import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:joblance/controller/create_CV_controller.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/screens/create_CV/CV_textfields.dart';

class CreateCV extends StatelessWidget {
  const CreateCV({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateCVControllerImpl());
    return Scaffold(
      body: GetBuilder<CreateCVControllerImpl>(
        builder: (controller) => Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            SafeArea(
                child: Text(
              "createyourcv".tr,
              style: TextStyles.w50017(context),
            )),
            CVTextFields( controller: controller)
          ],
        ),
      ),
    );
  }
}
