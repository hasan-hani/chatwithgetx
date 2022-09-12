import 'package:chatwhitgetx/core/constatnt/appColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class DividerWithText extends StatelessWidget {
  final String firstText ;
  final String secondText ;
  final Function()? onTap ;
  const DividerWithText(
      {Key? key,
        required this.firstText,
        required this.secondText,
        required this.onTap
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      height: 4*Get.height/16,
      child: Column(
        children: [
          Divider(color: AppColor.dividerColor,thickness: 2,),
          Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Text(firstText),
                  InkWell(
                    onTap:onTap ,
                      child: Text(secondText,style: TextStyle(color: AppColor.primaryColor),))
                ]
            ),
          )
        ],
      ),
    );
  }
}
