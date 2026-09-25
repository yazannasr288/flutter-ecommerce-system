import 'dart:io';

import 'package:admin/linkapi.dart';

import '../../../../core/class/crud.dart';

class Offersdata {
  Crud crud;

  Offersdata(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.offerview, {});
    return response.fold((l) => l, (r) => r);
  }

  add(Map data, File file) async {
    var response = await crud.addRequestWithImageOne(
      AppLink.offeradd,
      data,
      file,
    );
    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await crud.postData(AppLink.offerdelete, data);
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data, [File? file]) async {
    var response = await crud.postData(AppLink.offeredit, data);

    response = await crud.addRequestWithImageOne(AppLink.offeredit, data, file);

    return response.fold((l) => l, (r) => r);
  }
}
