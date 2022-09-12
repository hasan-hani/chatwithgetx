import '../../core/class/crud.dart'             ;
import '../../core/constatnt/localApiLink.dart' ;

class SearchData {
  Crud crud ;
  SearchData(this.crud) ;
  postData(String userName)async {
    var response=await crud.postData(
        LocalApiLink.findpartnerbyname,
        {
          'username':userName
        }
        );
    return response.fold((l) => l, (r) => r)  ;
  }
}