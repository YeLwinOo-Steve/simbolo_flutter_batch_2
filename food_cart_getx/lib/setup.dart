import 'package:get/get.dart';

import 'controller/home_controller.dart';

class Binding{
  static void setUp(){
    Get.put(HomeController());
  }
}