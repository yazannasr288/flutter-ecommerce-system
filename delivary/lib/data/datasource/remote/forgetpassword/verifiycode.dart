import 'package:delivary/linkapi.dart';

import '../../../../core/class/crud.dart';

class VerifiyCodeForgetPasswordData{
  Crud crud ;
  VerifiyCodeForgetPasswordData(this.crud);
  postData( String email,String verifiycode,)async{
    var response = await crud.postData(AppLink.verifycodeforgetpassword,{
      "email" : email,
      "verifiycode" : verifiycode,


    });
    return response.fold((l) => l,(r) =>r);
  }
}

