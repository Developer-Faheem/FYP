import 'package:get/get.dart';
import 'package:stylesage/utils/network_manager/network_manger.dart';

class GeneralBindings extends Bindings {
//called when the app start
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManger());
  }
}
