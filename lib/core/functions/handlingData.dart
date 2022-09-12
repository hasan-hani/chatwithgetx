import 'package:chatwhitgetx/core/class/statusRequest.dart';

StatusRequest HandlingData(response){
  return (response is StatusRequest)? response:StatusRequest.success ;
}