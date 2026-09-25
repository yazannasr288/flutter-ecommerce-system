import 'package:admin/linkapi.dart';

import '../../../../core/class/crud.dart';

class CheckemailData{
  Crud crud ;
  CheckemailData(this.crud);
  postData( String email)async{
    var response = await crud.postData(AppLink.checkemail,{
      "email" : email,


    });
    return response.fold((l) => l,(r) =>r);
  }
}

