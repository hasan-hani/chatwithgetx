import 'package:chatwhitgetx/view/screen/loginScreen.dart';
import 'package:flutter/material.dart'         ;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart'        ;

import 'homePage.dart';
class SuccessSignUp extends StatelessWidget {
  static String id='/SuccessSignUp'                 ;
  const SuccessSignUp({Key? key}) : super(key: key) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.offNamed(LoginScreen.id) ;
            },
            child: Text('success sign up'))                ,
      ),
    )                                               ;
  }
}
