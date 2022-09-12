import 'package:chatwhitgetx/core/service/myService.dart';
import 'package:chatwhitgetx/data/crud.dart'                    ;
import 'package:chatwhitgetx/data/model/userModel.dart';
import 'package:chatwhitgetx/view/screen/chattingPage.dart';
import 'package:chatwhitgetx/view/screen/homePage.dart';
import 'package:get/get.dart'                                   ;
import 'package:chatwhitgetx/core/constatnt/localApiLink.dart'  ;
import 'package:flutter/material.dart'                          ;

abstract class ChattingController extends GetxController {
  receiveMessage()                ;
  sendMessageMethod()             ;
}
class ChattingControllerImp extends ChattingController{
  UserModel userModels =Get.arguments               ;
  List<dynamic> chattingList =[]                    ;
  late String   myAccountName                       ;
  late TextEditingController messageController      ;
  @override
  receiveMessage() async{
    Crud  crud = Crud()                                        ;
    var response=await crud.postrequest(
        LocalApiLink.chattingLink                              ,
       {
         'tablename':userModels.name.toString()
       }
    )  ;
    if(response['status']=='sucess'){
      chattingList=response['data']                           ;
    }
    else{

    }
  }
  @override
  Future<void> onInit() async {
    messageController   =  TextEditingController()                                   ;
    MyService myService =  Get.put(MyService())                                      ;
    myAccountName=  myService.sharedPreferences!.getString('myname').toString()   ;
    await receiveMessage()                                                       ;
    update()                                                                     ;
    super.onInit()                                                               ;
  }

  @override
  sendMessageMethod()async  {
    Crud crud =Crud()      ;
    var  response=await crud.postrequest(
        LocalApiLink.sendMessage,
        {
          'sendername'    : myAccountName                  ,
          'tablename'     : userModels.name                ,
          'messagecontent': messageController.text
        }
    )                                                  ;
    //Get.offNamed(HomePage.id)                          ;
  }


}
