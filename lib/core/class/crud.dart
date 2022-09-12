import 'dart:convert'                        ;
import 'package:chatwhitgetx/core/class/statusRequest.dart';
import 'package:chatwhitgetx/core/functions/checkinternet.dart';
import 'package:dartz/dartz.dart'            ;
import 'package:http/http.dart' as http      ;
String _basicAuth = 'Basic ' +
    base64Encode(utf8.encode(
        'hasan:hasan1234')  );

Map<String, String> myHeaders = {
  'authorization': _basicAuth
}        ;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    try {
        var response = await http.post(
            Uri.parse(linkUrl)                    ,
            body    : data                        ,
            headers : myHeaders                   ,
            encoding: Encoding.getByName("utf-8")
        );
        if (response.statusCode >= 200 || response.statusCode < 300) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody)   ;
          return Right(responseBody);
        } else {
          print('============${response.statusCode}================');
          return const Left(StatusRequest.serverFailure)     ;
        }
      }
     catch (e) {
      print('============================');
      print(e);
      print('=============================');
          return const Left(StatusRequest.failure)     ;
    }
  }
}
