import 'package:chatwhitgetx/core/constatnt/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText ;
  final void Function() onPressed ;
  const CustomElevatedButton({
    Key? key,
    required this.buttonText,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height/16,
      padding: EdgeInsets.symmetric(horizontal: Get.width/4),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColor.primaryColor)
        ),
        child: Text(buttonText),
        onPressed: () {
          onPressed() ;
        },
      ),
    );
  }
}
