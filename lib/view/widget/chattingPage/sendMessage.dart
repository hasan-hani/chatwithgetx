import 'package:chatwhitgetx/control/chatting_controller.dart';
import 'package:flutter/material.dart'             ;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
class SendMessage extends StatelessWidget {
  const SendMessage({Key? key}) : super(key: key)  ;
  @override
  Widget build(BuildContext context) {
    ChattingControllerImp controller= Get.put(ChattingControllerImp()) ;
    return Container(
      height: 100,
      width: Get.width,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextFormField(
            controller: controller.messageController       ,
            decoration:InputDecoration(
              suffixIcon: IconButton(icon: Icon(Icons.send),
                onPressed: () async {
                  await controller.sendMessageMethod() ;
                },),
                border:OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32))
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius:BorderRadius.all(Radius.circular(32))  )
            ) ,
          ),
        ),
      ),
    )                             ;
  }
}
