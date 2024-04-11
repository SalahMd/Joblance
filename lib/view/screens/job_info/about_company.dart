import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class AboutCompany extends StatelessWidget {
  const AboutCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Dimensions.screenWidth(context),
          height: 50.h,
          alignment: AlignmentDirectional.centerStart,
          margin: EdgeInsets.symmetric(vertical: 10.h),
          padding: EdgeInsetsDirectional.only(
            start: 10.w,
          ),
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          child: Text(
            "aboutcompany".tr,
            style: TextStyles.w50015(context),
          ),
        ),
        Container(
          width: Dimensions.screenWidth(context),
          margin: EdgeInsets.symmetric(
            horizontal: 5.h,
          ),
          decoration: BoxDecoration(
              // color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          child: Text(
            "fsnesoifn oin eosienfo foishfesoih ieshf opesihf olfsn isen ieusfn esibf iuiun nosohi insef noeisfnheisnof nseoifn senfoi nsef noeisnfi nesoifnoi snief niesnfo isneofin esoifn iosenfoi nesoinf oiesnifonb njfn;odifnv ;iofdn io bsoi beoisb eoisbf oiesbf oibes",
            style: TextStyles.w40012grey(context),
          ),
        ),
      ],
    );
  }
}
