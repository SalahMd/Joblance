import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/subscription_back.dart';

abstract class ChoosePlanController extends GetxController {
  getPlans();
}

class ChoosePlanControllerImpl extends ChoosePlanController {
  SubscriptionBack subscriptionBack = new SubscriptionBack(Get.put(Crud()));
  StatusRequest? statusRequest, subscriptionStatus;
  late String token, language;
  Myservices myservices = Get.find();
  List data = [];
  @override
  void onInit() async {
    token = myservices.sharedPreferences.getString("token")!;
    language = myservices.sharedPreferences.getString("lang")!;
    super.onInit();
    await getPlans();
  }

  @override
  getPlans() async {
    statusRequest = StatusRequest.loading;
    var response = await subscriptionBack.getSubscriptionPlans(token, language);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      }
    }
    update();
  }

  confirmSubscription(String type) async {
    subscriptionStatus = StatusRequest.loading;
    animationedAlert(
      AppAnimations.loadings,
      "pleasewait".tr,
    );

    var response =
        await subscriptionBack.addSubscription(token, {"type": type});
    subscriptionStatus = handelingData(response);
    Get.back();
    if (StatusRequest.success == subscriptionStatus) {
      if (response['status'] == "success") {
        Get.to("HomePage");
        animationedAlert(
          AppAnimations.done,
          "thanksforsubscribing".tr,
        );
      } else {
        animationedAlert(
          AppAnimations.wrong,
          "youhavenobalanceinyourwallet".tr,
        );
      }
    } else {
      animationedAlert(
        AppAnimations.wrong,
        "couldn'tsubscribe".tr,
      );
    }
    update();
  }
}
