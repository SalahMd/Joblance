import 'package:get/get.dart';
import 'package:joblance/core/class/statusrequest.dart';


abstract class EmailVerifictionController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verificationCode);
}

class EmailVerifictionControllerImpl extends EmailVerifictionController {
  String? email;
  StatusRequest? statusRequest;
  @override
  checkCode() {}

  @override
  goToSuccessSignUp(String verificationCode) async {
    
  }

  @override
  void onInit() {
    //email = Get.arguments['email'];
    super.onInit();
  }
}
