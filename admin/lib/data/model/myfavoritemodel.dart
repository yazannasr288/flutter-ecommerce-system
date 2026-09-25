// class MyFavoriteModel {
//   String? favoriteId;
//   String? favoriteUsersid;
//   String? favoriteItemsid;
//   String? itemsId;
//   String? itemsName;
//   String? itemsNameAr;
//   String? itemsDesc;
//   String? itemsDescAr;
//   String? itemsImage;
//   String? itemsCount;
//   String? itemsActives;
//   String? itemsPrice;
//   String? itemsDiscount;
//   String? itemsDate;
//   String? itemsCat;
//   String? usersId;
//
//   MyFavoriteModel(
//       {this.favoriteId,
//       this.favoriteUsersid,
//       this.favoriteItemsid,
//       this.itemsId,
//       this.itemsName,
//       this.itemsNameAr,
//       this.itemsDesc,
//       this.itemsDescAr,
//       this.itemsImage,
//       this.itemsCount,
//       this.itemsActives,
//       this.itemsPrice,
//       this.itemsDiscount,
//       this.itemsDate,
//       this.itemsCat,
//       this.usersId});
//
//   MyFavoriteModel.fromJson(Map<String, dynamic> json) {
//     favoriteId = json['favorite_id'];
//     favoriteUsersid = json['favorite_usersid'];
//     favoriteItemsid = json['favorite_itemsid'];
//     itemsId = json['items_id'];
//     itemsName = json['items_name'];
//     itemsNameAr = json['items_name_ar'];
//     itemsDesc = json['items_desc'];
//     itemsDescAr = json['items_desc_ar'];
//     itemsImage = json['items_image'];
//     itemsCount = json['items_count'];
//     itemsActives = json['items_actives'];
//     itemsPrice = json['items_price'];
//     itemsDiscount = json['items_discount'];
//     itemsDate = json['items_date'];
//     itemsCat = json['items_cat'];
//     usersId = json['users_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['favorite_id'] = this.favoriteId;
//     data['favorite_usersid'] = this.favoriteUsersid;
//     data['favorite_itemsid'] = this.favoriteItemsid;
//     data['items_id'] = this.itemsId;
//     data['items_name'] = this.itemsName;
//     data['items_name_ar'] = this.itemsNameAr;
//     data['items_desc'] = this.itemsDesc;
//     data['items_desc_ar'] = this.itemsDescAr;
//     data['items_image'] = this.itemsImage;
//     data['items_count'] = this.itemsCount;
//     data['items_active'] = this.itemsActives;
//     data['items_price'] = this.itemsPrice;
//     data['items_discount'] = this.itemsDiscount;
//     data['items_date'] = this.itemsDate;
//     data['items_cat'] = this.itemsCat;
//     data['users_id'] = this.usersId;
//     return data;
//   }
// }
class MyFavoriteModel {
  String? get pricediscount {
    if (itemsPrice != null && itemsDiscount != null) {
      double price = double.tryParse(itemsPrice!) ?? 0;
      double discount = double.tryParse(itemsDiscount!) ?? 0;
      double finalPrice = price - (price * discount / 100);
      return finalPrice.toStringAsFixed(2);
    }
    return null;
  }

  String? favoriteId;
  String? favoriteUsersid;
  String? favoriteItemsid;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActives;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCat;
  String? usersId;

  MyFavoriteModel({
    this.favoriteId,
    this.favoriteUsersid,
    this.favoriteItemsid,
    this.itemsId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsDesc,
    this.itemsDescAr,
    this.itemsImage,
    this.itemsCount,
    this.itemsActives,
    this.itemsPrice,
    this.itemsDiscount,
    this.itemsDate,
    this.itemsCat,
    this.usersId,
  });

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id']?.toString();
    favoriteUsersid = json['favorite_usersid']?.toString();
    favoriteItemsid = json['favorite_itemsid']?.toString();
    itemsId = json['items_id']?.toString();
    itemsName = json['items_name']?.toString();
    itemsNameAr = json['items_name_ar']?.toString();
    itemsDesc = json['items_desc']?.toString();
    itemsDescAr = json['items_desc_ar']?.toString();
    itemsImage = json['items_image']?.toString();
    itemsCount = json['items_count']?.toString();
    itemsActives = json['items_actives']?.toString();
    itemsPrice = json['items_price']?.toString();
    itemsDiscount = json['items_discount']?.toString();
    itemsDate = json['items_date']?.toString();
    itemsCat = json['items_cat']?.toString();
    usersId = json['users_id']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['favorite_id'] = favoriteId;
    data['favorite_usersid'] = favoriteUsersid;
    data['favorite_itemsid'] = favoriteItemsid;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_actives'] = itemsActives;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_date'] = itemsDate;
    data['items_cat'] = itemsCat;
    data['users_id'] = usersId;
    return data;
  }
}
