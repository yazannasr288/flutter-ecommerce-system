import 'package:ecommerse/linkapi.dart';

import '../../../core/class/crud.dart';

class Addressdata {
  Crud crud;

  Addressdata(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLink.addressview, {
      "usersid":usersid
    });
    return response.fold((l) => l, (r) => r);
  }

  addData(
    String usersid,
    String name,
    String city,
    String street,
    String lat,
    String long,
    String note,
  ) async {
    var response = await crud.postData(AppLink.addressAdd, {
      "usersid": usersid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
      "note": note,
    });
    return response.fold((l) => l, (r) => r);
  }

  deletedata(String addressid) async {
    var response = await crud.postData(AppLink.addressdelete, {
      "addressid":addressid
    });
    return response.fold((l) => l, (r) => r);
  }

  editData(
      String addressid,
      String name,
      String city,
      String street,
      String lat,
      String long,
      String note,
      ) async {
    var response = await crud.postData(AppLink.addressedit, {
      "addressid": addressid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
      "note": note,
    });
    return response.fold((l) => l, (r) => r);
  }
}
