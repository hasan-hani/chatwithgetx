import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyService extends GetxService{
  SharedPreferences? sharedPreferences ;
  Future<MyService> init()async{
    sharedPreferences =await SharedPreferences.getInstance()   ;
    return this ;
  }

  initialService() async {
    await Get.putAsync(()=>MyService().init());
  }
}