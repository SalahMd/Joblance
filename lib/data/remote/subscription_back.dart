import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class SubscriptionBack {
  Crud crud;
  SubscriptionBack(this.crud);

  getSubscriptionPlans(String token, String lang) async {
    var response = await crud.postAndGetData(
        AppLinks.price +"?lang=" + lang,
        {},
        {
          'Authorization': 'Bearer $token',
        },
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
  addSubscription(String token,Map data) async {
    var response = await crud.postAndGetData(
        AppLinks.subscription,
        data,
        {
          'Authorization': 'Bearer $token',
        },
        null,
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

}
