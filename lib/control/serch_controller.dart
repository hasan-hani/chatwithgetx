import 'package:chatwhitgetx/core/class/statusRequest.dart';
import 'package:chatwhitgetx/data/crud.dart';
import 'package:flutter/material.dart' ;
import 'package:get/get.dart'          ;
import 'package:chatwhitgetx/core/constatnt/localApiLink.dart' ;

abstract class SearchController extends GetxController{
  search() ;
}
class SearchControllerImp extends SearchController{
  StatusRequest statusRequest=StatusRequest.none     ;
  bool isSearched=false                              ;
  List searchData=[]                                ;
  late TextEditingController nameCon                 ;
  @override
  search()async {
    Crud crud =Crud()                   ;
    var response =await crud.postrequest(
        LocalApiLink.findpartnerbyname,
        {
          'username':nameCon.text,

        }
    )    ;
    print(response)     ;
    if(response['status']=='succes'){
      statusRequest=  StatusRequest.none             ;
      searchData=response['data']    ;
      isSearched=true                ;
      update()                       ;
    }
    else{

      update()                       ;
    }
  }
  @override
  void onInit() {
    nameCon=TextEditingController()  ;
  }
}