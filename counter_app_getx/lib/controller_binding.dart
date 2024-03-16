import 'package:counter_app/domain/counter_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CounterController());
  }
}
