// class OrdersModel {
//   String? ordersId;
//   String? ordersUsersid;
//   String? ordersAddress;
//   String? ordersType;
//   String? ordersPricedilivery;
//   String? ordersPrice;
//   String? ordersTotalprice;
//   String? ordersCopon;
//   String? ordersPaymethod;
//   String? ordersStatus;
//   String? ordersDate;
//   String? addressId;
//   String? addressUsersid;
//   String? addressName;
//   String? addressCity;
//   String? addressStreet;
//   String? addressLat;
//   String? addressLong;
//   String? addressnote;
//
//   OrdersModel(
//       {this.ordersId,
//       this.ordersUsersid,
//       this.ordersAddress,
//       this.ordersType,
//       this.ordersPricedilivery,
//       this.ordersPrice,
//       this.ordersTotalprice,
//       this.ordersCopon,
//       this.ordersPaymethod,
//       this.ordersStatus,
//       this.ordersDate,
//       this.addressId,
//       this.addressUsersid,
//       this.addressName,
//       this.addressCity,
//       this.addressStreet,
//       this.addressLat,
//       this.addressnote,
//       this.addressLong});
//
//   OrdersModel.fromJson(Map<String, dynamic> json) {
//     ordersId = json['orders_id'];
//     ordersUsersid = json['orders_usersid'];
//     ordersAddress = json['orders_address'];
//     ordersType = json['orders_type'];
//     ordersPricedilivery = json['orders_pricedilivary'];
//     ordersPrice = json['orders_price'];
//     ordersTotalprice = json['orders_totalprice'];
//     ordersCopon = json['orders_copon'];
//     ordersPaymethod = json['orders_paymethod'];
//     ordersStatus = json['orders_status'];
//     ordersDate = json['orders_date'];
//     addressId = json['address_id'];
//     addressUsersid = json['address_usersid'];
//     addressName = json['address_name'];
//     addressCity = json['address_city'];
//     addressStreet = json['address_street'];
//     addressLat = json['address_lat'];
//     addressLong = json['address_long'];
//     addressnote= json['address_note'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['orders_id'] = this.ordersId;
//     data['orders_usersid'] = this.ordersUsersid;
//     data['orders_address'] = this.ordersAddress;
//     data['orders_type'] = this.ordersType;
//     data['orders_pricedilivary'] = this.ordersPricedilivery;
//     data['orders_price'] = this.ordersPrice;
//     data['orders_totalprice'] = this.ordersTotalprice;
//     data['orders_copon'] = this.ordersCopon;
//     data['orders_paymethod'] = this.ordersPaymethod;
//     data['orders_status'] = this.ordersStatus;
//     data['orders_date'] = this.ordersDate;
//     data['address_id'] = this.addressId;
//     data['address_usersid'] = this.addressUsersid;
//     data['address_name'] = this.addressName;
//     data['address_city'] = this.addressCity;
//     data['address_street'] = this.addressStreet;
//     data['address_lat'] = this.addressLat;
//     data['address_long'] = this.addressLong;
//     data['address_note'] = this.addressnote;
//     return data;
//   }
// }
class OrdersModel {
  String? ordersId;
  String? ordersUsersid;
  String? ordersAddress;
  String? ordersType;
  String? ordersPricedilivery;
  double? ordersPrice;
  String? ordersTotalprice;
  String? ordersCopon;
  String? ordersPaymethod;
  String? ordersStatus;
  String? ordersDate;
  String? ordersRating;
  String? ordersNoterating;
  String? addressId;
  String? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;
  String? addressnote;

  OrdersModel({
    this.ordersId,
    this.ordersUsersid,
    this.ordersAddress,
    this.ordersType,
    this.ordersPricedilivery,
    this.ordersPrice,
    this.ordersTotalprice,
    this.ordersCopon,
    this.ordersPaymethod,
    this.ordersRating,
    this.ordersNoterating,
    this.ordersStatus,
    this.ordersDate,
    this.addressId,
    this.addressUsersid,
    this.addressName,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
    this.addressnote,
  });

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id']?.toString();
    ordersUsersid = json['orders_usersid']?.toString();
    ordersAddress = json['orders_address']?.toString();
    ordersType = json['orders_type']?.toString();
    ordersPricedilivery = json['orders_pricedilivary']?.toString();
    ordersPrice = (json['orders_price'] as num?)?.toDouble();
    ordersTotalprice = json['orders_totalprice']?.toString();
    ordersCopon = json['orders_copon']?.toString();
    ordersPaymethod = json['orders_paymethod']?.toString();
    ordersStatus = json['orders_status']?.toString();
    ordersRating = json['orders_rating']?.toString();
    ordersNoterating = json['orders_noterating']?.toString();
    ordersDate = json['orders_date']?.toString();
    addressId = json['address_id']?.toString();
    addressUsersid = json['address_usersid']?.toString();
    addressName = json['address_name']?.toString();
    addressCity = json['address_city']?.toString();
    addressStreet = json['address_street']?.toString();
    addressLat = json['address_lat']?.toString();
    addressLong = json['address_long']?.toString();
    addressnote = json['address_note']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['orders_id'] = ordersId;
    data['orders_usersid'] = ordersUsersid;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_pricedilivary'] = ordersPricedilivery;
    data['orders_price'] = ordersPrice;
    data['orders_totalprice'] = ordersTotalprice;
    data['orders_copon'] = ordersCopon;
    data['orders_paymethod'] = ordersPaymethod;
    data['orders_rating'] = ordersRating;
    data['orders_noterating'] = ordersNoterating;
    data['orders_status'] = ordersStatus;
    data['orders_date'] = ordersDate;
    data['address_id'] = addressId;
    data['address_usersid'] = addressUsersid;
    data['address_name'] = addressName;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    data['address_note'] = addressnote;
    return data;
  }

}
