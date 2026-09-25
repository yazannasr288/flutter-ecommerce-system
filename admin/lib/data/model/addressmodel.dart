// class AddressModel {
//   String? addressId;
//   String? addressUsersid;
//   String? addressName;
//   String? addressCity;
//   String? addressStreet;
//   String? addressLat;
//   String? addressLong;
//   String? addressnote;
//
//   AddressModel(
//       {this.addressId,
//       this.addressUsersid,
//       this.addressName,
//       this.addressCity,
//       this.addressStreet,
//       this.addressLat,
//       this.addressLong,this.addressnote});
//
//   AddressModel.fromJson(Map<String, dynamic> json) {
//     addressId = json['address_id'];
//     addressUsersid = json['address_usersid'];
//     addressName = json['address_name'];
//     addressCity = json['address_city'];
//     addressStreet = json['address_street'];
//     addressLat = json['address_lat'];
//     addressLong = json['address_long'];
//     addressnote = json['address_note'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
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
class AddressModel {
  String? addressId;
  String? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;
  String? addressnote;

  AddressModel({
    this.addressId,
    this.addressUsersid,
    this.addressName,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
    this.addressnote,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
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
