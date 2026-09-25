import 'package:ecommerse/linkapi.dart';

import '../../../../core/class/crud.dart';

class Cartdata {
  Crud crud;

  Cartdata(this.crud);

  addcart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartadd, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deletecart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartdelete, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  getcountcart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartgetcountitems, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewcart(String usersid) async {
    var response = await crud.postData(AppLink.cartview, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  checkcopon(String coponname) async {
    var response = await crud.postData(AppLink.checkcopon, {
      "coponname": coponname,
    });
    return response.fold((l) => l, (r) => r);
  }
}
