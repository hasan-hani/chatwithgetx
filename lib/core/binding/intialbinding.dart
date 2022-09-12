import 'package:chatwhitgetx/core/class/crud.dart';
import 'package:get/get.dart';

class IniatialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }

}