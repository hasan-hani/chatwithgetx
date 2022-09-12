import 'package:get/get.dart';

abstract class HomePageController extends GetxController{
  chooseBootomBar(int val) ;

}
class HomePageControllerImp extends HomePageController{
  int index=0 ;
  chooseBootomBar(int val){
    index=val ;
    update()  ;
  }
}