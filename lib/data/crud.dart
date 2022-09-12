import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
String _basicAuth = 'Basic ' +
    base64Encode(utf8.encode(
        'hasan:hasan1234'));

Map<String, String> myheaders = {
  'authorization': _basicAuth
     }  ;
class Crud {
  postrequest(String url,Map data)async{
    try {
      var response = await http.post(
          Uri.parse(url)               ,
          body: data                   ,
          headers: myheaders           ,
          encoding: Encoding.getByName("utf-8") );
      if (response.statusCode == 200) {
        Map responseBody=jsonDecode(response.body) ;
        return responseBody ;
      }
      else {
        print('error code is ${response.statusCode} ');
        return {'status':'fail'};
      }
    }
    catch(e){
      print('catch error is  $e')  ;
      return {'status':'fail'}     ;
    }
  }
  postrequstwhitfile(String url,Map data,File file)async{
    var request=http.MultipartRequest('POST',Uri.parse(url));
    var fileleng= await file.length() ;
    var stream= http.ByteStream(file.openRead());
    var multipartfile= http.MultipartFile(
        'file',stream,fileleng,filename:basename(file.path) );
    request.files.add(multipartfile) ;
    request.headers.addAll(myheaders) ;
    data.forEach(
            (key, value) {
          request.fields[key]=value ;
        });
    var myrequest=  await request.send();
    var response =  await http.Response.fromStream(myrequest);
    print('==============response==================')  ;
    print(response)       ;
    print('======================================') ;
    if(myrequest.statusCode==200){
      return jsonDecode(response.body);

    }
    else{

      return {'error': 'code:${response.statusCode.toString()}'};

    }


  }

}