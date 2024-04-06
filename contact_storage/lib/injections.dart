import 'package:contact_storage/contact_controller.dart';
import 'package:contact_storage/shared_data.dart';
import 'package:get/get.dart';

class Injections{
  static void init(){
    Get.put(SharedData());
    Get.put(ContactController());
  }
}