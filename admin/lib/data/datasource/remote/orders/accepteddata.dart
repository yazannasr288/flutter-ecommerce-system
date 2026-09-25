import 'package:admin/linkapi.dart';

import '../../../../core/class/crud.dart';

class Accepteddata{
  Crud crud ;
  Accepteddata(this.crud);
  getData()async{
    var response = await crud.postData(AppLink.accepted,{
    });
    return response.fold((l) => l,(r) =>r);
  }
  doneprepare(String ordersid,String usersid,String ordertype,)async{
    var response = await crud.postData(AppLink.prepare,{
      "ordersid": ordersid,"usersid": usersid,"orderstype": ordertype,
    });
    return response.fold((l) => l,(r) =>r);
  }


}

