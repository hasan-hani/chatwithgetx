import 'package:chatwhitgetx/control/homePage_controller.dart';
import 'package:chatwhitgetx/core/constatnt/appColor.dart';
import 'package:chatwhitgetx/view/widget/homepage/appBar.dart';
import 'package:chatwhitgetx/view/widget/homepage/home.dart';
import 'package:chatwhitgetx/view/screen/message.dart';
import 'package:chatwhitgetx/view/widget/homepage/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageControllerImp> {
  static String id='/HomePage'     ;
  String title='Home' ;
  List<Widget> mainWidget=[
    Home()      ,
    Search()    ,
    Message()   ,
  ]                                ;
  List<String> titles=[
    'Home'            ,
    'Find a partner'  ,
    'Messages'        ,
  ]                   ;
  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(builder: (controller) {
      return Scaffold(
          appBar:AppBarHome(titles[controller.index]),
          bottomNavigationBar:BottomNavigationBar(
            unselectedItemColor: Colors.black26     ,
            selectedItemColor: AppColor.primaryColor,
            currentIndex: controller.index          ,
            onTap: (value) {
              controller.chooseBootomBar(value) ;
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.email),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.check),label: 'search'),
              BottomNavigationBarItem(icon: Icon(Icons.email),label: 'message'),
            ],
          ),
          body: mainWidget[controller.index]
      );
    },) ;
  }
}
