import 'package:ecommerse/linkapi.dart';

import '../../../../../core/class/crud.dart';

class HomebestData{
  Crud crud ;
  HomebestData(this.crud);
  getbestData()async{
    var response = await crud.postData(AppLink.homebest,{});
    return response.fold((l) => l,(r) =>r);
  }

}

