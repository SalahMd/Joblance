import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/task_offers_controller.dart';
import 'package:joblance/view/screens/task_offers/task_offfers_top_bar.dart';
import 'package:joblance/view/widgets/task_offer_widget.dart';

class TaskOffers extends StatelessWidget {
  final String id;
  final String name;
  final String dateOfPost;
  const TaskOffers({super.key, required this.id, required this.name, required this.dateOfPost});

  @override
  Widget build(BuildContext context) {
    Get.put(TaskOffersControllerImpl(id: id));
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<TaskOffersControllerImpl>(
          builder: (controller) => Column(
            children: [
              TaskOffersTopBar(name: name, numOfOffers: controller.data.length.toString(), dateOfPost: dateOfPost),
              SizedBox(
                height: 20.h,
              ),
              ListView.builder(
                  itemCount: controller.data.length,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TaskOfferWidget(
                        userName: controller.data[index]["name"],
                        userImage: controller.data[index]["image"],
                        majorName: controller.data[index]['major_name'],
                        offerInfo: controller.data[index]['information'],
                        budget: controller.data[index]['budget'].toString(),
                        excutingTime:
                            controller.data[index]['excuting_time'].toString(),
                        datePosted: controller.data[index]['created_at']);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
