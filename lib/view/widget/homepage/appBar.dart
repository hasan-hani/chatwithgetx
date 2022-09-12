import 'package:chatwhitgetx/core/constatnt/appColor.dart';
import 'package:flutter/material.dart';

AppBarHome(String title){
  return PreferredSize(
    preferredSize: Size.fromHeight(50),
    child: AppBar(
      title: Text(
        title,
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
      backgroundColor: AppColor.primaryColor,
      centerTitle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
    ),
  ) ;
}
