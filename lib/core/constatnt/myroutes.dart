import 'package:chatwhitgetx/view/screen/chattingPage.dart';
import 'package:chatwhitgetx/view/screen/homePage.dart';
import 'package:chatwhitgetx/view/screen/loginScreen.dart';
import 'package:chatwhitgetx/view/screen/signUpScreen.dart';
import 'package:chatwhitgetx/view/screen/successSignUP.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../middleware/myMiddleWare.dart';


List<GetPage<dynamic>>? Myroutes=[
  GetPage(name: '/'              ,page: () => LoginScreen()   ,
      middlewares:[MyMiddleWare()] ),
  GetPage(name: LoginScreen  .id  , page: () => LoginScreen()   , ),
  GetPage(name: SignupScreen .id  , page: () => SignupScreen()  , ),
  GetPage(name: HomePage     .id  , page: () => HomePage()      , ),
  GetPage(name: SuccessSignUp.id  , page: () => SuccessSignUp() , ),
  GetPage(name: ChattingPage.id   , page: () => ChattingPage()  , ),
];

