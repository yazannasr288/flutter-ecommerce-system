import 'package:delivary/linkapi.dart';

import '../../../core/class/crud.dart';

class Accepteddata{
  Crud crud ;
  Accepteddata(this.crud);
  getData(String delivaryid)async{
    var response = await crud.postData(AppLink.viewaccepted,{
      "id": delivaryid
    });
    return response.fold((l) => l,(r) =>r);
  }
  donedelivary(String ordersid,String usersid,)async{
    var response = await crud.postData(AppLink.done,{
      "ordersid": ordersid,"usersid": usersid
    });
    return response.fold((l) => l,(r) =>r);
  }


}

