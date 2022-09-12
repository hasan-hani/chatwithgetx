import 'package:chatwhitgetx/core/service/myService.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../view/screen/homePage.dart';

class MyMiddleWare extends GetMiddleware{
  @override
  int? get priority =>0               ;
  MyService myService = Get.find()    ;
  @override
  RouteSettings? redirect(String? route) {
    if(myService.sharedPreferences!.getString('step')=='1'){
      return  RouteSettings(name:HomePage.id)  ;
    }
    return null;
  }

}