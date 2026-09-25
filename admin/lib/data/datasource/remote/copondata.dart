import 'package:admin/linkapi.dart';
import '../../../../core/class/crud.dart';

class Copondata {
  Crud crud;

  Copondata(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.coponview, {});
    return response.fold((l) => l, (r) => r);
  }

  add(Map data) async {
    var response = await crud.postData(AppLink.coponadd, data);
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data) async {
    var response = await crud.postData(AppLink.coponedit, data);
    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await crud.postData(AppLink.copondelete, data);
    return response.fold((l) => l, (r) => r);
  }
}
