import 'package:chatwhitgetx/core/constatnt/appColor.dart';
import 'package:chatwhitgetx/core/constatnt/appImage.dart'   ;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'                       ;
import 'package:get/get_core/src/get_main.dart'              ;
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:chatwhitgetx/control/signUp_controller.dart' ;
import 'package:get/get.dart'                                ;

class RowLoadImage extends GetView<SignUpContollerImp> {
  @override
  Widget build(BuildContext context) {
    Get.put(SignUpContollerImp())                               ;
    return GetBuilder<SignUpContollerImp>(
        builder: (controller) {
          return Row(
              mainAxisAlignment : MainAxisAlignment .center              ,
              crossAxisAlignment: CrossAxisAlignment.center              ,
              children:[
                controller.isImageLoaded?
                Container(
                  height:150, width:150,
                  child: Image.file(controller.Myfile),
                )
                :Container(
                    height: 150, width: 150,
                    child: Image.asset(AppImage.image,fit:BoxFit.fill ,)),
                IconButton(
                  onPressed:()async{
                    return Get.defaultDialog(
                      backgroundColor: AppColor.primaryColor    ,
                      title: 'choose the source of image'       ,
                      titleStyle: TextStyle(color: Colors.white),
                      content: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Get.back()   ;
                              controller.uploadImmagefromCamera(context) ;
                            },
                            child: Text('choose image from camera'),

                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.back()   ;
                              controller.uploadImageFromGallery(context) ;
                            },
                            child: Text('choose image from gallery'),
                          ),
                        ],
                      )                      ,
                    ) ;
                  },
                  icon: Icon(Icons.menu),
                ),
              ]

          );
        },
    );
  }
}
