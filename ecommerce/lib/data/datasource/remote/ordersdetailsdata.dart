import 'package:ecommerse/linkapi.dart';

import '../../../core/class/crud.dart';

class Ordersdetailsdata{
  Crud crud ;
  Ordersdetailsdata(this.crud);
  getData(String id)async{
    var response = await crud.postData(AppLink.ordersdetails,{"id":id});
    return response.fold((l) => l,(r) =>r);
  }
}
