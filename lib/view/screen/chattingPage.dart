import 'package:chatwhitgetx/control/chatting_controller.dart';
import 'package:chatwhitgetx/core/constatnt/appColor.dart';
import 'package:chatwhitgetx/core/service/myService.dart';
import 'package:chatwhitgetx/data/model/chattingModel.dart'      ;
import 'package:chatwhitgetx/view/widget/chattingPage/chattingCard.dart';
import 'package:chatwhitgetx/view/widget/chattingPage/sendMessage.dart';
import 'package:flutter/material.dart'                           ;
import 'package:get/get.dart'                                    ;
import 'package:get/get_core/src/get_main.dart'                  ;
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart'  ;

class ChattingPage extends GetView<ChattingControllerImp> {
  static String id='/Chatting'            ;
  @override
  Widget build(BuildContext context) {
    Get.put(MyService())   ;
    Get.put(ChattingControllerImp())      ;
    return GetBuilder<ChattingControllerImp>(
        init:ChattingControllerImp() ,
        builder: (controller) {
          return Scaffold(
            appBar:   AppBar(
              backgroundColor: AppColor.primaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.myAccountName.toString()       ,
                    style: TextStyle(color: Colors.white),)   ,
                  Text(
                    controller.userModels.name.toString()     ,
                    style: TextStyle(color: Colors.white),)   ,
                ],
              )  ,
            )  ,
            body  :   Column(
              children: [
                SizedBox(
                  height: Get.height-200,
                  child: Center(
                    child:ListView.builder(
                      reverse: true                            ,
                      itemCount: controller.chattingList.length,
                        itemBuilder: (context, index) {
                          return ChattingCard(
                            partnerUserName: controller.userModels.name                           ,
                            chattingModel: ChattingModel.fromJson(controller.chattingList[index]) ,
                            username: controller.myAccountName   )   ;
                        },
                    )
                  ),
                )       ,
                SendMessage()
              ],
            )  ,

          );
        },
    );
  }
}
