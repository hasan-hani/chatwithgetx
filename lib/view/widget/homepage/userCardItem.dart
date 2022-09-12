
import 'package:chatwhitgetx/core/constatnt/appImage.dart';
import 'package:chatwhitgetx/core/constatnt/localApiLink.dart';
import 'package:chatwhitgetx/data/model/userModel.dart';
import 'package:chatwhitgetx/view/screen/chattingPage.dart';
import 'package:flutter/material.dart'   ;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class UsersCardItme extends StatelessWidget {
  final UserModel userModel  ;
  const UsersCardItme({
    Key? key,
    required this.userModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
            ChattingPage.id,
            arguments: userModel) ;
      },
      child: Container(
        height: 100    ,
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child:Image.network("${LocalApiLink.imagApilink}/${userModel.image}") ,),
              SizedBox(width: 20,)                                         ,
              Text('name:${userModel.name}')                                 ,
            ],
          ),
        ),
      ),
    );
  }
}
