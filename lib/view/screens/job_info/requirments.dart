import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class Requirements extends StatelessWidget {
  const Requirements({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenwidth(context),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "requirments".tr,
            style: TextStyles.w50017,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "- fsnesoifn oin eosienfo foishfesoih ieshf\n- opesihf olfsn isen ieusfn esibf iuiun nosohi\n- insef noeisfnheisnof nseoifn senfoi nsef noeisnfi nesoifnoi\n- snief niesnfo isneofin esoifn iosenfoi nesoinf oiesnifonb njfn;odifnv\n- ;iofdn io bsoi beoisb eoisbf oiesbf oibes",
            style: TextStyles.w40011grey,
          )
        ],
      ),
    );
    ;
  }
}
