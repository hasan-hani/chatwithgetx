import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
bool CheckInputValidation(String val ,int min,int max,String type){
  if(type=='email') {
    if(!val.isEmail){
      return false ;
    }
  }
  if(type=='phone') {
    if(!val.isPhoneNumber){
      return false ;
    }
  }
  if(val.length<min){
    return false ;
  }
  if(val.length>max){
    return false ;
  }
  return true ;
}
InputValidation(String val ,int min,int max,String type){
  if(type=='email') {
    if(!val.isEmail){
      return 'not vaild email' ;
    }
  }
  if(type=='phone') {
    if(!val.isPhoneNumber){
      return 'not valid phone number'  ;
    }
  }
  if(val.length<min){
    return 'increse the number of char' ;
  }
  if(val.length>max){
    return 'decrese the number of chr'  ;
  }
}