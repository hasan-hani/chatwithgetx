
import 'package:chatwhitgetx/control/signUp_controller.dart';
import 'package:chatwhitgetx/core/constatnt/appColor.dart';
import 'package:chatwhitgetx/core/functions/inputValidation.dart';
import 'package:chatwhitgetx/view/widget/customElevatedButton.dart';
import 'package:chatwhitgetx/view/widget/customTextFormField.dart';
import 'package:chatwhitgetx/view/widget/divderWithText.dart';
import 'package:chatwhitgetx/view/widget/signUpwidget/checkBoxSignUp.dart';
import 'package:chatwhitgetx/view/widget/signUpwidget/cutomTextFieldSignUp.dart';
import 'package:chatwhitgetx/view/widget/signUpwidget/dropDown.dart';
import 'package:chatwhitgetx/view/widget/signUpwidget/rowLoadImage.dart';
import 'package:chatwhitgetx/view/widget/titlePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SignupScreen extends GetView<SignUpContollerImp> {
  static String id='/SignupScreen' ;
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpContollerImp contollerImp = Get.put(SignUpContollerImp());
    return GetBuilder<SignUpContollerImp>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: ListView(
                children: [
                  SizedBox(height: 5,),
                  const TitlePage(title: 'Sign Up',)                    ,
                  RowLoadImage()                                        ,
                  SizedBox(height: 20,)                                 ,
                  CustomTextFormFiledSignUp(
                    onChanged   :(val) {
                      contollerImp.customeTextOnChanged()     ;
                    } ,
                    isValid     : contollerImp.isNameValid     ,
                    icon        : Icons.person                 ,
                    hint        : 'Name'                       ,
                    mycontroller:contollerImp.nameCont         ,
                    validator   : (val) {
                      return contollerImp.validName(val!)      ;
                    }                                            ,
                  )                        ,
                  SizedBox           (height: 20,)                      ,
                  CustomTextFormFiledSignUp(
                    onChanged   :(val) {
                      contollerImp.customeTextOnChanged()     ;
                    } ,
                    isValid:contollerImp.isAgeValid ,
                    icon: Icons.real_estate_agent_rounded,
                    hint: 'Age'                          ,
                    mycontroller:contollerImp.ageCont ,
                    validator: (val) {
                      return contollerImp.validAge(val!)  ;
                    },
                  )                        ,
                  DropDown()                                            ,
                  SizedBox           (height: 20,)                      ,
                  CustomTextFormFiledSignUp(
                    onChanged   :(val) {
                      contollerImp.customeTextOnChanged()     ;
                    } ,
                    isValid: contollerImp.isPhoneValid           ,
                    isNumber:true                                ,
                    icon: Icons.phone                            ,
                    hint: 'Phone number'                         ,
                    mycontroller:contollerImp.phoneCont          ,
                    validator: (val) {
                      return contollerImp.validPhoneNumber(val!);
                    },
                  )                        ,
                  SizedBox           (height: 20,)                      ,
                  CustomTextFormFiledSignUp(
                    onChanged   :(val) {
                      contollerImp.customeTextOnChanged()     ;
                    } ,
                    isValid:contollerImp.isEmailValid            ,
                    icon: Icons.email                            ,
                    hint: 'Email'                                ,
                    mycontroller:contollerImp.emailCont          ,
                    validator: (val) {
                      return contollerImp.validEmail(val!);
                    },
                  )                        ,
                  SizedBox(height: 20,)                                 ,
                  CustomTextFormFiledSignUp(
                    onChanged   :(val) {
                      contollerImp.customeTextOnChanged()     ;
                    } ,
                    isValid:contollerImp.isPasswordValid  ,
                    icon: Icons.vpn_key,
                    hint: 'Password',
                    mycontroller:contollerImp.passwordCont,
                    validator: (val) {
                      return contollerImp.validPassword(val!);
                    },
                  )                        ,
                  SizedBox           (height: 20,)                      ,
                  CustomTextFormFiledSignUp(
                    onChanged   :(val) {
                      contollerImp.customeTextOnChanged()     ;
                    } ,
                    isValid:contollerImp.isRePasswordValid  ,
                    icon: Icons.vpn_key,
                    hint: 'Reenter password',
                    mycontroller:contollerImp.repasswordCont,
                    validator: (val) {
                      return contollerImp.validReenterPassword(val!);
                    },
                  )                        ,
                  AcceptedTermCheckBoxSignUp()                                      ,
                  SizedBox(height: 20,)                                 ,
                  CustomElevatedButton(
                    buttonText: 'Sign Up',
                    onPressed: () {
                      contollerImp.goToScucessSignUp() ;
                    },)                             ,
                  SizedBox(height: 20,)                                 ,
                  DividerWithText(
                    firstText: "I have an account?, ",
                    secondText: 'Log in',
                    onTap: () {
                      contollerImp.goToLogin() ;
                    },
                  )                                  ,
                ],
              ),
            ),
          ),
        )   ;
      },
    );
  }
}
