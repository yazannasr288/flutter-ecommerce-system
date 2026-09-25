import 'package:ecommerse/linkapi.dart';

import '../../../../../core/class/crud.dart';

class Myfavoritedata {
  Crud crud;

  Myfavoritedata(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.favoriteview, {"id": id});
    return response.fold((l) => l, (r) => r);
  }


  deleteData(String id) async {
    var response = await crud.postData(AppLink.deletfromfavorite, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
