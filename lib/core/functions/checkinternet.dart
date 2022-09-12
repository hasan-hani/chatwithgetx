import 'dart:io';

Future<bool> checkInternet()async{
  try{
    var result  =  await InternetAddress.lookup('www.google.com') ;
    if(result.isNotEmpty){
      return true    ;
    }else{
      return false   ;
    }
  }catch(_){
    return false     ;
  }
}