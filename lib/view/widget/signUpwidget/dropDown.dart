import 'package:chatwhitgetx/control/signUp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDown extends GetView<SignUpContollerImp> {
  const DropDown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SignUpContollerImp())               ;
    List<String> items=['male','female']        ;
    String SelectedValue='male'                 ;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child  : DropdownButtonFormField(
        hint : Text('male')        ,
        value: SelectedValue       ,
        items:items.map((item) =>
            DropdownMenuItem<String>(
              child: Text(item)    ,
              value: item          ,
            )).toList() ,
        onChanged: (value) {
          controller.dropDownChangeValue(value.toString(),SelectedValue
          )                 ;
        }                                                           ,
      ),
    )                       ;
  }
}
