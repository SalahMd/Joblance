import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class Requirements extends StatelessWidget {
  const Requirements({super.key});

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
            "requirments".tr,
            style: TextStyles.w50015(context),
          ),
        ),
        Container(
          width: Dimensions.screenWidth(context),
          margin: EdgeInsets.symmetric(horizontal: 10.h),
          padding: EdgeInsets.symmetric(
            vertical: 3.h,
          ),
          child: Text(
            "- fsnesoifn oin eosienfo foishfesoih ieshf\n- opesihf olfsn isen ieusfn esibf iuiun nosohi\n- insef noeisfnheisnof nseoifn senfoi nsef noeisnfi nesoifnoi\n- snief niesnfo isneofin esoifn iosenfoi nesoinf oiesnifonb njfn;odifnv\n- ;iofdn io bsoi beoisb eoisbf oiesbf oibes",
            style: TextStyles.w40012grey(context),
          ),
        ),
      ],
    );
  }
}
