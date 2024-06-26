import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/chat/conversations_back.dart';

abstract class ChatListController extends GetxController {}

class ChatListControllerImpl extends ChatListController {
  StatusRequest? statusRequest;
  late String token;
  List<Map<dynamic, dynamic>> conversations = [];
  Myservices myServices = Get.find();
  Conversations conversation = Conversations(Get.put(Crud()));
  void onInit() async {
    statusRequest = StatusRequest.loading;
    update();
    token = myServices.sharedPreferences.getString("token")!;
    var response = await conversation.getConversations(token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        conversations = (response['data'] as List<dynamic>)
            .map((item) => item as Map<dynamic, dynamic>)
            .toList();
      }
    }
    update();

    super.onInit();
  }

  void dispose() {
    super.dispose();
  }
}
