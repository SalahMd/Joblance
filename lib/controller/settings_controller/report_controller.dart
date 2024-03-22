import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ReportController extends GetxController {}

class ReportControllerImpl extends ReportController {
  late TextEditingController reportTitle;
  late TextEditingController reportbody;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void onInit() {
    reportTitle = TextEditingController();
    reportbody = TextEditingController();
    super.onInit();
  }
  void dispose() {
    reportTitle.dispose();
    reportbody.dispose();
    super.dispose();
  }
}
