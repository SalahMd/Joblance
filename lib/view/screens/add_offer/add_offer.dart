import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/add_offer_controller.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/add_offer/offer_tex_fields.dart';

class AddOffer extends StatelessWidget {
  const AddOffer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddOfferControllerImpl()); 
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<AddOfferControllerImpl>(
          builder:(controller)=>
           Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               SizedBox(
                  height: 10.h,
                ),
                SafeArea(
                    child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 10.w),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back)),
                      SizedBox(width: 10.w),
                      Text(
                        "addyouroffer".tr,
                        style: TextStyles.w50019(context),
                      ),
                    ],
                  ),
                )),
                SizedBox(height: 30.h),
              OfferTextFields(controller: controller),
                GestureDetector(
                  onTap: () {
                   // controller.applay();
                  },
                  child: Container(
                    width: Dimensions.screenWidth(context),
                    height: 40.h,
                    margin:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 30.h),
                    decoration: AppButtons.buttonDecoration,
                    alignment: Alignment.center,
                    child: Text(
                      "applay".tr,
                      style: TextStyles.w50012White(context),
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
