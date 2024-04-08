import 'package:get/get.dart';

abstract class SearchController extends GetxController {
  dispDatat();
  filterData();
}

class SearchControllerImpl extends SearchController {
  bool isJob = false;
  @override
  dispDatat() {}

  @override
  filterData() {}
}
