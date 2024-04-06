import 'package:contact_storage/shared_data.dart';
import 'package:get/get.dart';

class ContactController extends GetxController{
  final sharedData = Get.find<SharedData>();
  final contactConst = Constants();
  RxList<String> phoneNumbers = <String>[].obs;
  void addContacts(){
    for (var name in contactConst.names) {
      int index = contactConst.names.indexOf(name);
      sharedData.setString(name, contactConst.phones[index]);
    }
    getContacts();
  }

  void getContacts() async {
    for(var name in contactConst.names){
      phoneNumbers.add(await sharedData.getString(name));
    }
  }
}


class Constants {
  List<String> names = [
    'Ye Lwin Oo',
    'Naing Lynn Aung',
    'Myo Min Ko',
    'Aung Pyae Sone Moe'
  ];
  List<String> phones = [
    '092487237423',
    '09111111111',
    '0922222222',
    '0933333333'
  ];
}
