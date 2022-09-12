import 'package:chatwhitgetx/core/constatnt/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';


class CustomTextFormFiled extends StatelessWidget {
  final void Function()?       onChanged               ;
  final String                    hint                 ;
  final IconData                  icon                 ;
  final TextEditingController     mycontroller         ;
  final String? Function(String?) validator            ;
  final bool?                     isNumber             ;
  final bool?                     isObscure            ;
  final bool                      isValid              ;
  const CustomTextFormFiled({
    Key? key                                             ,
    this.onChanged                                       ,
    required                      this.hint              ,
    required                      this.icon              ,
    required                      this.mycontroller      ,
    required                      this.validator         ,
    required                      this.isValid           ,
    this.isNumber                                        ,
    this.isObscure                                       ,
  })                                     ;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height : 100            ,
      child  : Row(
        children: [
          SizedBox(
            width: 2*Get.width/2.5  ,
            child: TextFormField(
                onTap:onChanged ,
                obscureText: (isObscure==null)||(isObscure==false) ?
                false:true                                         ,
                keyboardType:(isNumber==null)||(isNumber==false)   ?
                TextInputType.text : TextInputType.number          ,
                autovalidateMode   : AutovalidateMode.always       ,
                validator: validator                               ,
                controller: mycontroller                           ,
                decoration: InputDecoration(
                    label: Text(hint)                                         ,
                    suffixIcon: Icon(icon)                                    ,
                    icon: Icon(Icons.check,color: isValid?
                    AppColor.primaryColor:Colors.transparent,)              ,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)
                    )
                )
            ),
          ) ,
          Icon(Icons.check ,
              color: isValid? AppColor.primaryColor:Colors.transparent),
        ],
      )      ,
    )        ;
  }
}

