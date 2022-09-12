import 'package:chatwhitgetx/control/messageController.dart';
import 'package:chatwhitgetx/core/service/myService.dart';
import 'package:chatwhitgetx/view/widget/chattingPage/chattingCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MessageController())   ;
    Get.put(MyService())   ;
    return GetBuilder<MessageController>(
      builder: (controller) {
      return Center(
        child: ListView.builder(
          itemCount:controller.contactMessage.length ,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 50,
              child: InkWell(
                onTap: ()async {
                  await controller.goToChatting(controller.contactMessage[index].toString()) ;
                },
                child: Card(
                    color: Colors.deepOrangeAccent,
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          controller.contactMessage[index],
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          )  ,
                        ),
                      ),
                    )
                ),
              ),
            )  ;
          },
        ),
      );
    },);
  }
}
