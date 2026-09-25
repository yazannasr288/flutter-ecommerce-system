import 'package:admin/linkapi.dart';
import '../../../../core/class/crud.dart';

class AdminAccountData {
  Crud crud;

  AdminAccountData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.adminview, {});
    return response.fold((l) => l, (r) => r);
  }

  add(Map data) async {
    var response = await crud.postData(AppLink.adminadd, data);
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data) async {
    var response = await crud.postData(AppLink.adminedit, data);
    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await crud.postData(AppLink.admindelete, data);
    return response.fold((l) => l, (r) => r);
  }
  view(String adminid) async {
    var response = await crud.postData(AppLink.adminview1, {
      "id": adminid
    });
    return response.fold((l) => l, (r) => r);
  }

}
