import 'package:chatwhitgetx/control/login_controller.dart'   ;
import 'package:chatwhitgetx/core/constatnt/appColor.dart'    ;
import 'package:flutter/material.dart'                        ;
import 'package:get/get.dart'                                 ;

class CheckBoxWithText extends GetView<LoginControllerImp> {
  final String text ;
  const CheckBoxWithText(this.text, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginControllerImp>(builder: (controller) {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              fillColor:MaterialStateProperty.all(AppColor.primaryColor) ,
              value: controller.rememberMe         ,
              onChanged: (value) {
                controller.checkRememberMe(value!) ;
              },),
            Text(text)
          ],
        ),
      ) ;
    },);
  }
}
