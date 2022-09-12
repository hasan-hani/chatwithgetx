import 'package:chatwhitgetx/core/class/statusRequest.dart';
import 'package:chatwhitgetx/core/constatnt/appColor.dart';
import 'package:chatwhitgetx/core/constatnt/localApiLink.dart';
import 'package:chatwhitgetx/core/functions/handlingData.dart';
import 'package:chatwhitgetx/data/crud.dart';
import 'package:chatwhitgetx/data/remoteData/loginData.dart';
import 'package:chatwhitgetx/view/screen/homePage.dart';
import 'package:chatwhitgetx/view/screen/signUpScreen.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart'             ;
import 'package:chatwhitgetx/core/service/myService.dart';

import '../core/functions/checkinternet.dart';

abstract class LoginContoller extends GetxController{
  goToHomeScreen(BuildContext context)    ;
  goToSignUpScreen()                      ;
  checkRememberMe(bool value)             ;
}
class LoginControllerImp extends LoginContoller{
  StatusRequest statusRequest =StatusRequest.none                   ;
  LoginData loginData =LoginData(Get.find())                        ;
  MyService myService            =Get.find()                        ;
  late TextEditingController emailCont                              ;
  late TextEditingController passwordCont                           ;
  late bool rememberMe =false                                       ;
  GlobalKey<FormState>       loginFormState=GlobalKey<FormState>()  ;
  @override
  goToHomeScreen(BuildContext context)async {
      statusRequest=StatusRequest.loading    ;
      update()   ;
      var response  =  await loginData.postUserData(emailCont.text, passwordCont.text) ;
      statusRequest =  HandlingData(response)  ;
      print('============$response===========') ;
      if(statusRequest==StatusRequest.success){
        if(response['status']=='success'){
          myService.sharedPreferences!.setInt('id', response['data']['id'])              ;
          myService.sharedPreferences!.setString('name', response['data']['name'])       ;
          myService.sharedPreferences!.setInt('age', response['data']['age'])            ;
          myService.sharedPreferences!.setString('phone', response['data']['phone'])     ;
          myService.sharedPreferences!.setString('image', response['data']['image'])     ;
          myService.sharedPreferences!.setString('country', response['data']['country']) ;
          myService.sharedPreferences!.setString('city', response['data']['city'])       ;
          myService.sharedPreferences!.setString('step', '1')                            ;

          Get.offNamed(HomePage.id)  ;
        }else{
          return Get.defaultDialog(
            title: 'wrong',
            middleText: 'wrong password or email'
          )  ;
          statusRequest=StatusRequest.none ;
          update()     ;
        }
      }
      else{
        update() ;
        Future.delayed(const Duration(seconds: 3),() {
          statusRequest=StatusRequest.none ;
          update()                         ;
        }, )  ;
      }
    }



  @override
  void onInit() {
    emailCont      =  TextEditingController() ;
    passwordCont   =  TextEditingController() ;
    super.onInit();
  }
  @override
  void dispose() {
    emailCont    .dispose() ;
    passwordCont .dispose() ;
    super        .dispose() ;
  }

  @override
  goToSignUpScreen() {
    Get.offNamed(SignupScreen.id) ;
  }

  @override
  checkRememberMe(bool value) {
    rememberMe=value ;
  }

}