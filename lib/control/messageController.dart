import 'package:chatwhitgetx/core/constatnt/localApiLink.dart';
import 'package:chatwhitgetx/core/service/myService.dart';
import 'package:chatwhitgetx/data/crud.dart';
import 'package:chatwhitgetx/data/model/userModel.dart';
import 'package:chatwhitgetx/view/screen/chattingPage.dart';
import 'package:get/get.dart';

class MessageController extends GetxController{
  late String myAccountName                                     ;
  List<String> contactMessage=[]                                ;
  getAllMessage()async{
    Crud crud =Crud()                                           ;
    var response=await crud.postrequest(
        LocalApiLink.getAllMessage,
        {'tablename':myAccountName})                            ;
    if(response['status']=='sucess'){
      (response['data'] as List).forEach(
              (sender) {
                contactMessage.add(sender['sender'].toString()) ;
              }
      )  ;
    }

  }
  @override
  Future<void> onInit() async {
    MyService myService =  Get.put(MyService())    ;
    myAccountName=myService.sharedPreferences!.getString('myname').toString()  ;
    await getAllMessage()   ;
    update()                ;
    super.onInit()          ;
  }
  goToChatting(String partnerName) async {
    Crud crud=Crud()                ;
    var response=await crud.postrequest(
        LocalApiLink.getCertineUser,
        {
          'username':partnerName
        }
    )  ;
    if(response['status']=='success'){
      late UserModel userModel        ;
      userModel=UserModel.fromJson(response['data'][0])       ;
      Get.toNamed(ChattingPage.id,arguments: userModel)    ;

    }
    
  }
}