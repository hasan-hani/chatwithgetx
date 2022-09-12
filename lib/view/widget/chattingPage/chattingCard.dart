import 'package:chatwhitgetx/data/model/chattingModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ChattingCard extends StatelessWidget {
  final partnerUserName             ;
  final ChattingModel chattingModel ;
  final String username             ;
  ChattingCard(
     {
    required this.chattingModel     ,
    required this.username          ,
    required this.partnerUserName   ,
     }
      );
  @override
  Widget build(BuildContext context) {
    if(((chattingModel.sender==username)&&(chattingModel.reciver==partnerUserName))
        ||((chattingModel.sender==partnerUserName)&&(chattingModel.reciver==username))){
      return Directionality(
        textDirection: username==chattingModel.sender?
        TextDirection.ltr:TextDirection.rtl,
        child: Card(
          color: username==chattingModel.sender? Colors.grey:Colors.white,
          child: Text(
            chattingModel.message.toString(),
            style: TextStyle(
                color: username==chattingModel.sender?Colors.white:Colors.black,fontSize: 18),
          ),
        ),
      );
    }
    else{
      return Text('');
    }
  }
}
