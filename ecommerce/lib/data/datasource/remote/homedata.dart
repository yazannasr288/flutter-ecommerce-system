import 'package:ecommerse/linkapi.dart';

import '../../../../../core/class/crud.dart';

class HomeData{
  Crud crud ;
  HomeData(this.crud);
  getData()async{
    var response = await crud.postData(AppLink.home,{});
    return response.fold((l) => l,(r) =>r);
  }


  searchData(String search)async{
    var response = await crud.postData(AppLink.searchitems,{"search": search});

    return response.fold((l) => l,(r) =>r);
  }
}

