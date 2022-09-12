import 'package:chatwhitgetx/core/constatnt/appColor.dart';
import 'package:chatwhitgetx/core/functions/inputValidation.dart';
import 'package:chatwhitgetx/core/constatnt/localApiLink.dart';
import 'package:chatwhitgetx/data/crud.dart';
import 'package:chatwhitgetx/view/screen/loginScreen.dart';
import 'package:chatwhitgetx/view/screen/successSignUP.dart';
import 'package:flutter/material.dart'                    ;
import 'package:get/get.dart';
import 'dart:io'             ;
import 'package:image_picker/image_picker.dart'                   ;

abstract class SignUpController extends GetxController{
  dropDownChangeValue(String value,String selectedValue) ;
  goToLogin()                                    ;
  goToScucessSignUp()                            ;
  uploadImageFromGallery(BuildContext context)   ;
  uploadImmagefromCamera(BuildContext context)   ;
  validEmail(String val)                         ;
  validName(String val)                          ;
  validAge(String val)                           ;
  validPhoneNumber(String val)                   ;
  validPassword(String val)                      ;
  validReenterPassword(String val)               ;
  customeTextOnChanged()                         ;
  acceptedTermMethod(bool isAccepted)            ;
}
class SignUpContollerImp extends SignUpController{
  String gender='1'                              ;
  bool isAcceptedValue=false                     ;
  late TextEditingController emailCont           ;
  late TextEditingController nameCont            ;
  late TextEditingController ageCont             ;
  late TextEditingController phoneCont           ;
  late TextEditingController passwordCont        ;
  late TextEditingController repasswordCont      ;
  late TextEditingController countryCont         ;
  late TextEditingController cityCont            ;
  bool isNameValid       =false                  ;
  bool isAgeValid        =false                  ;
  bool isPhoneValid      =false                  ;
  bool isEmailValid      =false                  ;
  bool isPasswordValid   =false                  ;
  bool isRePasswordValid =false                  ;
  GlobalKey<FormState>     formstate = new GlobalKey<FormState>()   ;
  late File Myfile ;
  bool isImageLoaded =false ;
  @override
  goToLogin() {
    Get.offNamed(LoginScreen.id)                 ;
  }
  @override
  void onInit() {
    emailCont       = TextEditingController()   ;
    nameCont        = TextEditingController()   ;
    ageCont         = TextEditingController()   ;
    phoneCont       = TextEditingController()   ;
    passwordCont    = TextEditingController()   ;
    repasswordCont  = TextEditingController()   ;
    countryCont     = TextEditingController()   ;
    cityCont        = TextEditingController()   ;
    super.onInit();
  }

  @override
  uploadImageFromGallery(BuildContext context)async {
     ImagePicker _picker = ImagePicker();
     XFile? image ;
       image = await _picker.pickImage(source: ImageSource.gallery);

     Myfile=File(image!.path)                            ;
     if(Myfile!=null){
       isImageLoaded=true                                ;
     }
     update() ;
  }

  @override
  uploadImmagefromCamera(BuildContext context) async {
     ImagePicker _picker = ImagePicker();
     XFile? image ;
     image = await _picker.pickImage(source: ImageSource.camera);


     Myfile=File(image!.path)                                           ;
     if(Myfile!=null){
       isImageLoaded=true                                               ;
     }
     update()                                                           ;
  }

  @override
  goToScucessSignUp() async {
    Crud crud = Crud()    ;
      if(isImageLoaded){
        if(formstate.currentState!.validate()) {
          var response = await crud.postrequstwhitfile(
              LocalApiLink.signup,
              {
                'name': nameCont.text          ,
                'age' : ageCont.text           ,
                'gender': gender               ,
                'country': 'syria'             ,
                'city':  '4'                   ,
                'phone': phoneCont.text        ,
                'email': emailCont.text        ,
                'password': passwordCont.text  ,

              },
              Myfile);
          if(response['status']=='succes'){
          Get.toNamed(SuccessSignUp.id);}
          else{
            Get.defaultDialog(
              middleText     : 'http error'                      ,
              middleTextStyle: TextStyle(color: Colors.white)    ,
              backgroundColor: AppColor.primaryColor             ,
            ) ;
          }
        }
        else{
          return Get.defaultDialog(
            middleText: 'please enter valid information',
          )   ;
        }

      }
      else{
        return Get.defaultDialog(
          middleText: 'please upload your image profile'     ,
          middleTextStyle: TextStyle(color:Colors.white)   ,
          backgroundColor: AppColor.primaryColor           ,
          actions: [
            InkWell(
              onTap: () {
              Get.back()   ;
            },
              child:Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('OK',),
              ) ,
            )
          ]
        );
      }

  }
  @override
  dropDownChangeValue(String value,String selectedValue) {
    selectedValue =value  ;
    if(value=='male'){
      gender='1'  ;
    }
    else{
      gender='0'  ;
    }
    update()   ;

  }

  @override
  validAge(String val) {
    if(InputValidation(val, 1, 3, 'age')==null){
      isAgeValid = true  ;
    }
    else{
      isAgeValid=false   ;
    }
    return InputValidation(val, 1, 3, 'age')      ;
  }
  @override
  validEmail(String val) {
    if(InputValidation(val, 1, 13, 'email')==null){
      isEmailValid = true  ;
    }
    else{
      isEmailValid=false   ;
    }
    return InputValidation(val, 1, 13, 'email') ;
  }

  @override
  validName(String val) {
    if(InputValidation(val, 1, 3, 'name')==null){
      isNameValid = true  ;
    }
    else{
      isNameValid=false   ;
    }
    return InputValidation(val, 1, 3, 'name') ;

  }

  @override
  validPassword(String val) {
    if(InputValidation(val, 4, 15, 'password')==null){
      isPasswordValid = true  ;
    }
    else{
      isPasswordValid=false   ;
    }
    return InputValidation(val,4,15,'password')      ;
  }

  @override
  validPhoneNumber(String val) {
    if(InputValidation(val, 8, 15, 'phone')==null){
      isPhoneValid = true   ;
    }
    else{
      isPhoneValid=false    ;
    }
    return InputValidation(val,8,15,'phone')       ;
  }
  @override
  validReenterPassword(String val) {
    if(InputValidation(val, 8, 15, 'password')==null){
      isRePasswordValid = true  ;
    }
    else{
      isRePasswordValid=false   ;
    }
    return InputValidation(val,8,15,'password')      ;
  }

  @override
  customeTextOnChanged() {
    update()   ;
  }

  @override
  acceptedTermMethod(bool isAccepted) {
    isAcceptedValue= isAccepted     ;
    update()    ;
    print(isAcceptedValue)       ;

  }

}