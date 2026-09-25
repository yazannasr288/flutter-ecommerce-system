import 'package:ecommerse/linkapi.dart';

import '../../../core/class/crud.dart';

class PandingData{
  Crud crud ;
  PandingData(this.crud);
  getData(String usersid)async{
    var response = await crud.postData(AppLink.panding,{
      "id": usersid
    });
    return response.fold((l) => l,(r) =>r);
  }

  deletedata(String orderid)async{
    var response = await crud.postData(AppLink.ordersdelete,{"id":orderid});
    return response.fold((l) => l,(r) =>r);
  }
}

