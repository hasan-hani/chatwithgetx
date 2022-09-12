import 'package:chatwhitgetx/core/constatnt/localApiLink.dart';

import '../../core/class/crud.dart';

class LoginData {
  Crud crud             ;
  LoginData(this.crud)  ;
  postUserData(String email ,String  password) async {
    var response=await crud.postData(
        LocalApiLink.login,
        {
          'email'   :  email    ,
          'password':  password ,

        }) ;
    return response.fold((l) => l, (r) => r)  ;
  }
}