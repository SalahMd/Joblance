import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/widgets/divider.dart';

 payment(
  BuildContext context,
  String amount
) {
  Get.bottomSheet(Container(
      width: Dimensions.screenWidth(context),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 50.w,
                height: 5.h,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: LightAppColors.greyColor,
                    borderRadius: BorderRadius.circular(50)),
              ),
            )),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w),
          child: Text(
            "Select your payment method".tr,
            style: TextStyles.w50014(context),
          ),
        ),
        SizedBox(height: 30.h),
        GestureDetector(
          onTap: () async {
            Get.to(PaypalCheckout(
              sandboxMode: true,
              clientId:
                  "Af6sEWsXmy9h8Z-ymBz_fSBIrwWHZbhC7DiEH5_8S0DrQQC2Xz8kRVB5ydBYCta21L0EW3WYDuf7O3mC",
              secretKey:
                  "EBWzTITppe3TgVbPSSQBxIG7Emsc6uD9N-tTEVYe82g4-GaZJUDmVC2N0e5eX8HqYFJ5Fe8ozfwqLr1q",
              returnURL: "success.snippetcoder.com",
              cancelURL: "cancel.snippetcoder.com",
              transactions: [
                {
                  "amount": {
                    "total": amount,
                    "currency": "USD",
                    "details": {
                      "subtotal": amount,
                      "shipping": '0',
                      "shipping_discount": 0
                    }
                  },
                  "description": "The payment transaction description.",
                  "payment_options": {
                    "allowed_payment_method":
                        "INSTANT_FUNDING_SOURCE"
                  },
                  "item_list": {
                    "items": [
                      {
                        "name": "Apple",
                        "quantity": 4,
                        "price": '5',
                        "currency": "USD"
                      },
                      {
                        "name": "Pineapple",
                        "quantity": 5,
                        "price": '10',
                        "currency": "USD"
                      }
                    ],

                    // shipping address is not required though
                    //   "shipping_address": {
                    //     "recipient_name": "Raman Singh",
                    //     "line1": "Delhi",
                    //     "line2": "",
                    //     "city": "Delhi",
                    //     "country_code": "IN",
                    //     "postal_code": "11001",
                    //     "phone": "+00000000",
                    //     "state": "Texas"
                    //  },
                  }
                }
              ],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                print("onSuccess: $params");
              },
              onError: (error) {
                print("onError: $error");
                Navigator.pop(context);
              },
              onCancel: () {
                print('cancelled:');
              },
            ));
          },
          child: Container(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 15.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Paypal", style: TextStyles.w50013(context)),
                Container(
                  width: 25.w,
                  height: 35.h,
                  child: Image.asset(
                    AppImages.paypalLogo,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
        MyDivider(
          height: 2,
        ),
        Container(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 15.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("My budget", style: TextStyles.w50013(context)),
              Container(
                  width: 25.w,
                  height: 25.h,
                  child: Icon(
                    Icons.payment,
                    color: Colors.blue[900],
                    size: 25.sp,
                  )),
            ],
          ),
        ),
        SizedBox(height: 20.h),
      ]))));
}