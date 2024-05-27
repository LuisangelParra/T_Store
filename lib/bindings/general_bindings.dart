import 'package:get/get.dart';
import 'package:t_store/utils/helpers/networ_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
