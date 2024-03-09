import 'package:get/get.dart';

validInput(String val,int min,int max){
  if(val.isEmpty) {
    return ("empty".tr);
  }
  if(val.length>max) {
    return ("more".tr+"${max.toString()}"+"letters".tr);
  }
  if(val.length<min) {
    return ("less".tr+"${min.toString()}"+"letters".tr);
  }
  return null;
}