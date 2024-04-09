import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class AboutJob extends StatelessWidget {
  const AboutJob({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth(context),
      margin: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.w),
      decoration: BoxDecoration(
          //  color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "aboutjob".tr,
            style: TextStyles.w50015(context),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "fsnesoifn oin eosienfo foishfesoih ieshf opesihf olfsn isen ieusfn esibf iuiun nosohi insef noeisfnheisnof nseoifn senfoi nsef noeisnfi nesoifnoi snief niesnfo isneofin esoifn iosenfoi nesoinf oiesnifonb njfn;odifnv ;iofdn io bsoi beoisb eoisbf oiesbf oibes",
            style: TextStyles.w40012grey(context),
          )
        ],
      ),
    );
  }
}
