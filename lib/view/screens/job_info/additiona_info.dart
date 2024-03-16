import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class AdditionalInfo extends StatelessWidget {
  const AdditionalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenwidth(context),
      margin: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.w),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "additionalinfo".tr,
            style: TextStyles.w50017(context),
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
