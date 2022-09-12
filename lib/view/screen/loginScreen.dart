import 'package:chatwhitgetx/control/login_controller.dart';
import 'package:chatwhitgetx/core/constatnt/appImage.dart';
import 'package:chatwhitgetx/view/widget/login/checkBoxwithtextLogin.dart';
import 'package:chatwhitgetx/view/widget/customElevatedButton.dart';
import 'package:chatwhitgetx/view/widget/customTextFormField.dart';
import 'package:chatwhitgetx/view/widget/divderWithText.dart';
import 'package:chatwhitgetx/view/widget/titlePage.dart';
import 'package:flutter/material.dart'    ;
import 'package:get/get.dart'             ;
import 'package:chatwhitgetx/core/class/handlingData.dart' ;

class LoginScreen extends GetView<LoginControllerImp> {
  static String id='/LoginScreen'      ;

  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp()) ;
    return GetBuilder<LoginControllerImp>(builder: (controller) {
      return Scaffold(
          body: HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Center(
                child:Container(
                  child: Form(
                    key:controller.loginFormState                   ,
                    child: ListView(
                      children: [
                        const SizedBox( height:30,)                   ,
                        const TitlePage(title: 'Login',)              ,
                        const SizedBox( height:30 )                   ,
                        CustomTextFormFiled(
                          isValid: false,
                          icon: Icons.email                          ,
                          hint: 'Email'                              ,
                          mycontroller:controller.emailCont        ,
                          validator: (val) {
                          },
                        )                      ,
                        const SizedBox(height: 30)                    ,
                        CustomTextFormFiled(
                          isValid: false,
                          icon: Icons.vpn_key                            ,
                          hint: 'password'                               ,
                          mycontroller:controller.passwordCont         ,
                          validator: (val) {
                          },
                        )                      ,
                        const SizedBox(height: 30)                    ,
                        CustomElevatedButton(buttonText: 'Login',onPressed: () {
                          controller.goToHomeScreen(context) ;
                        },)                     ,
                        const SizedBox(height: 30)                    ,
                        const CheckBoxWithText('Remember me')         ,
                        const SizedBox(height:30)                     ,
                        DividerWithText(
                          firstText: "don't have an account?"              ,
                          secondText: 'Create account'                     ,
                          onTap: () {
                            controller.goToSignUpScreen()                ;
                          }                                                ,
                        )                          ,
                      ]                                               ,
                    ),
                  )                                                      ,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              AppImage.backgroundImage
                          )
                      )
                  )                         ,

                )
            ),
          )

      );
    },) ;
  }
}
