import 'package:chatwhitgetx/core/binding/intialbinding.dart';
import 'package:chatwhitgetx/core/service/myService.dart';
import 'package:chatwhitgetx/view/screen/homePage.dart';
import 'package:chatwhitgetx/view/screen/loginScreen.dart';
import 'package:chatwhitgetx/view/screen/signUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/constatnt/myroutes.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized() ;
  await MyService().initialService()        ;
  runApp(const MyApp())                     ;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: IniatialBinding()      ,
      theme: ThemeData(
        primarySwatch: Colors.blue           ,
        textTheme:   TextTheme(
          headline1: TextStyle(
            fontSize  : 24                   ,
            fontWeight: FontWeight.bold      ,
            color     : Colors.black         ,
          )
        )
      )                  ,
      getPages: Myroutes                     ,
    )                                        ;
  }
}


