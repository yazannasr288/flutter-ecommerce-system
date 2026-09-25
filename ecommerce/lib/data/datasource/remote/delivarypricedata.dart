import 'package:ecommerse/linkapi.dart';

import '../../../core/class/crud.dart';

class Delivarypricedata {
  Crud crud;

  Delivarypricedata(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.delivarypriceview, {
    });
    return response.fold((l) => l, (r) => r);
  }


}
