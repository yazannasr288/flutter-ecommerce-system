import 'package:ecommerse/linkapi.dart';

import '../../../core/class/crud.dart';

class Offerdata{
  Crud crud ;
  Offerdata(this.crud);
  getData()async{
    var response = await crud.postData(AppLink.offer,{});
    return response.fold((l) => l,(r) =>r);
  }
}
