import 'package:chatwhitgetx/control/serch_controller.dart';
import 'package:chatwhitgetx/core/constatnt/appColor.dart';
import 'package:chatwhitgetx/core/service/myService.dart';
import 'package:chatwhitgetx/data/model/userModel.dart';
import 'package:chatwhitgetx/view/widget/customTextFormField.dart';
import 'package:chatwhitgetx/view/widget/homepage/userCardItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../core/class/statusRequest.dart';

class Search extends GetView<SearchControllerImp> {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SearchControllerImp())     ;
    return GetBuilder<SearchControllerImp>(

      builder: (controller) {
        return Container(
          child: Center(
              child:Column(
                children: [
                  CustomTextFormFiled(
                      isValid: false,
                      hint: 'enter name',
                      icon: Icons.person,
                      mycontroller: controller.nameCon,
                      validator: (value) {

                      },),
                  ElevatedButton(
                    style:ButtonStyle(
                        backgroundColor:MaterialStateProperty.all(
                          AppColor.primaryColor
                        )
                    ) ,
                    child: Text('search'),
                    onPressed: () {
                      controller.search() ;
                    },
                  )     ,
                  controller.isSearched?
                  Expanded(
                    child: Container(
                      child: controller.statusRequest==StatusRequest.loading?
                      ListView.builder(
                        itemCount: controller.searchData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return
                            UsersCardItme(
                                userModel: UserModel.fromJson(controller.searchData[index])) ;
                        },

                      ):
                      CircularProgressIndicator(),
                    ),
                  ) :
                  Center(child: Column(
                    children: [
                      SizedBox(height: 100,)           ,
                      Text('search result'),
                    ],
                  ))
                ],
              )
          ),
        );
      },
    );
  }
}
