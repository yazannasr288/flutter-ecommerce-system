import 'package:admin/linkapi.dart';
import '../../../../core/class/crud.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);

  Future<dynamic> sendNotification({
    required String title,
    required String message,
    required String topic,
  }) async {
    var response = await crud.postData(AppLink.sendadminnotifi, {
      "title": title,
      "message": message,
      "topic": topic,
      "page_id": "",
      "page_name": "",
    });

    return response.fold((l) => l, (r) => r);
  }
}
