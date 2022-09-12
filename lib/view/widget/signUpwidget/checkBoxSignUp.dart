import 'package:chatwhitgetx/control/signUp_controller.dart';
import 'package:chatwhitgetx/core/constatnt/appColor.dart';
import 'package:flutter/material.dart' ;
import 'package:get/get.dart';
class AcceptedTermCheckBoxSignUp extends GetView<SignUpContollerImp> {
  bool isChecked=false ;
  AcceptedTermCheckBoxSignUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SignUpContollerImp()) ;
    return GetBuilder<SignUpContollerImp>(
        builder: (controller) {
          return Container(
            color: Colors.white  ,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor:MaterialStateProperty.all(AppColor.primaryColor) ,
                  value: controller.isAcceptedValue    ,
                  onChanged: (value) {
                    isChecked=value!                       ;
                    controller.acceptedTermMethod(value)  ;
                  },)            ,
                const Text('Accept the '),
                const Text(' Terms & Services',style: TextStyle(decoration: TextDecoration.underline),)
              ],
            ),
          ) ;
        },
    )    ;
  }
}
