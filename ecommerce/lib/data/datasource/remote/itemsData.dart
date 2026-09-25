import 'package:ecommerse/linkapi.dart';

import '../../../core/class/crud.dart';

class Itemsdata{
  Crud crud ;
  Itemsdata(this.crud);
  getData(String id,String userid)async{
    var response = await crud.postData(AppLink.items,{"id":id.toString(),"usersid":userid});
    return response.fold((l) => l,(r) =>r);
  }
}
