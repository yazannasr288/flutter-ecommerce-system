import 'package:admin/linkapi.dart';
import '../../../../core/class/crud.dart';

class DelivaryAccountData {
  Crud crud;

  DelivaryAccountData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.delivaryview, {});
    return response.fold((l) => l, (r) => r);
  }

  add(Map data) async {
    var response = await crud.postData(AppLink.delivaryadd, data);
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data) async {
    var response = await crud.postData(AppLink.delivaryedit, data);
    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await crud.postData(AppLink.delivarydelete, data);
    return response.fold((l) => l, (r) => r);
  }
}
