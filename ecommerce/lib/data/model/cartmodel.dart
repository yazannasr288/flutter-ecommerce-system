// class Cartmodel {
//   int? itemsprice;
//   int? countitems;
//   int? cartId;
//   int? cartUsersid;
//   int? cartItemsid;
//   int? itemsId;
//   String? itemsName;
//   String? itemsNameAr;
//   String? itemsDesc;
//   String? itemsDescAr;
//   String? itemsImage;
//   int? itemsCount;
//   int? itemsActives;
//   int? itemsPrice;
//   int? itemsDiscount;
//   String? itemsDate;
//   int? itemsCat;
//
//   Cartmodel(
//       {this.itemsprice,
//         this.countitems,
//         this.cartId,
//         this.cartUsersid,
//         this.cartItemsid,
//         this.itemsId,
//         this.itemsName,
//         this.itemsNameAr,
//         this.itemsDesc,
//         this.itemsDescAr,
//         this.itemsImage,
//         this.itemsCount,
//         this.itemsActives,
//         this.itemsPrice,
//         this.itemsDiscount,
//         this.itemsDate,
//         this.itemsCat});
//
//   Cartmodel.fromJson(Map<String, dynamic> json) {
//     itemsprice = json['itemsprice'];
//     countitems = json['countitems'];
//     cartId = json['cart_id'];
//     cartUsersid = json['cart_usersid'];
//     cartItemsid = json['cart_itemsid'];
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
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['itemsprice'] = this.itemsprice;
//     data['countitems'] = this.countitems;
//     data['cart_id'] = this.cartId;
//     data['cart_usersid'] = this.cartUsersid;
//     data['cart_itemsid'] = this.cartItemsid;
//     data['items_id'] = this.itemsId;
//     data['items_name'] = this.itemsName;
//     data['items_name_ar'] = this.itemsNameAr;
//     data['items_desc'] = this.itemsDesc;
//     data['items_desc_ar'] = this.itemsDescAr;
//     data['items_image'] = this.itemsImage;
//     data['items_count'] = this.itemsCount;
//     data['items_actives'] = this.itemsActives;
//     data['items_price'] = this.itemsPrice;
//     data['items_discount'] = this.itemsDiscount;
//     data['items_date'] = this.itemsDate;
//     data['items_cat'] = this.itemsCat;
//     return data;
//   }
// }
// class Cartmodel {
//   int? itemsprice;
//   int? countitems;
//   int? cartId;
//   int? cartUsersid;
//   int? cartItemsid;
//   int? itemsId;
//   String? itemsName;
//   String? itemsNameAr;
//   String? itemsDesc;
//   String? itemsDescAr;
//   String? itemsImage;
//   int? itemsCount;
//   int? itemsActives;
//   int? itemsPrice;
//   int? itemsDiscount;
//   String? itemsDate;
//   int? itemsCat;
//
//   Cartmodel({
//     this.itemsprice,
//     this.countitems,
//     this.cartId,
//     this.cartUsersid,
//     this.cartItemsid,
//     this.itemsId,
//     this.itemsName,
//     this.itemsNameAr,
//     this.itemsDesc,
//     this.itemsDescAr,
//     this.itemsImage,
//     this.itemsCount,
//     this.itemsActives,
//     this.itemsPrice,
//     this.itemsDiscount,
//     this.itemsDate,
//     this.itemsCat,
//   });
//
//   Cartmodel.fromJson(Map<String, dynamic> json) {
//     itemsprice = _toInt(json['itemsprice']);
//     countitems = _toInt(json['countitems']);
//     cartId = _toInt(json['cart_id']);
//     cartUsersid = _toInt(json['cart_usersid']);
//     cartItemsid = _toInt(json['cart_itemsid']);
//     itemsId = _toInt(json['items_id']);
//     itemsName = json['items_name']?.toString();
//     itemsNameAr = json['items_name_ar']?.toString();
//     itemsDesc = json['items_desc']?.toString();
//     itemsDescAr = json['items_desc_ar']?.toString();
//     itemsImage = json['items_image']?.toString();
//     itemsCount = _toInt(json['items_count']);
//     itemsActives = _toInt(json['items_actives']);
//     itemsPrice = _toInt(json['items_price']);
//     itemsDiscount = _toInt(json['items_discount']);
//     itemsDate = json['items_date']?.toString();
//     itemsCat = _toInt(json['items_cat']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['itemsprice'] = itemsprice;
//     data['countitems'] = countitems;
//     data['cart_id'] = cartId;
//     data['cart_usersid'] = cartUsersid;
//     data['cart_itemsid'] = cartItemsid;
//     data['items_id'] = itemsId;
//     data['items_name'] = itemsName;
//     data['items_name_ar'] = itemsNameAr;
//     data['items_desc'] = itemsDesc;
//     data['items_desc_ar'] = itemsDescAr;
//     data['items_image'] = itemsImage;
//     data['items_count'] = itemsCount;
//     data['items_actives'] = itemsActives;
//     data['items_price'] = itemsPrice;
//     data['items_discount'] = itemsDiscount;
//     data['items_date'] = itemsDate;
//     data['items_cat'] = itemsCat;
//     return data;
//   }
//
//   // دالة مساعدة لتحويل القيم إلى int بشكل آمن
//   int? _toInt(dynamic value) {
//     if (value == null) return null;
//     if (value is int) return value;
//     if (value is String) return int.tryParse(value);
//     return null;
//   }
// }
import 'package:ecommerse/core/function/num_parse.dart';

class Cartmodel {
  int? countitems;
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActives;
  double? itemsPrice;    // نغيّرها إلى double? لتقبل العشري
  double? itemsDiscount; // نغيّرها إلى double? لتقبل العشري
  String? itemsDate;
  int? itemsCat;

  Cartmodel({
    this.countitems,
    this.cartId,
    this.cartUsersid,
    this.cartItemsid,
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
  });

  Cartmodel.fromJson(Map<String, dynamic> json) {

    countitems    = _toInt(json['countitems']);
    cartId        = _toInt(json['cart_id']);
    cartUsersid   = _toInt(json['cart_usersid']);
    cartItemsid   = _toInt(json['cart_itemsid']);
    itemsId       = _toInt(json['items_id']);
    itemsName     = json['items_name']?.toString();
    itemsNameAr   = json['items_name_ar']?.toString();
    itemsDesc     = json['items_desc']?.toString();
    itemsDescAr   = json['items_desc_ar']?.toString();
    itemsImage    = json['items_image']?.toString();
    itemsCount    = _toInt(json['items_count']);
    itemsActives  = _toInt(json['items_actives']);
    itemsPrice    = json['items_price'] is num
        ? (json['items_price'] as num).toDouble()
        : (json['items_price']?.toString().toDouble());
    itemsDiscount = json['items_discount'] is num
        ? (json['items_discount'] as num).toDouble()
        : (json['items_discount']?.toString().toDouble());
    itemsDate     = json['items_date']?.toString();
    itemsCat      = _toInt(json['items_cat']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['countitems']    = countitems;
    data['cart_id']       = cartId;
    data['cart_usersid']  = cartUsersid;
    data['cart_itemsid']  = cartItemsid;
    data['items_id']      = itemsId;
    data['items_name']    = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc']    = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_image']   = itemsImage;
    data['items_count']   = itemsCount;
    data['items_actives'] = itemsActives;
    data['items_price']   = itemsPrice;
    data['items_discount']= itemsDiscount;
    data['items_date']    = itemsDate;
    data['items_cat']     = itemsCat;
    return data;
  }

  // دالة مساعدة لتحويل أي قيمة إلى int؟
  int? _toInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }

  /// نحسب السعر بعد الخصم (double) إن احتجنا
  double? get _finalPrice {
    final p = itemsPrice;
    final d = itemsDiscount;
    if (p == null || d == null) return null;
    return p - (p * d / 100);
  }


  /// السعر بعد الخصم كسلسلة لضبط العرض في الواجهة
  String? get itemspricediscount {
    final fp = _finalPrice;
    if (fp == null) return null;
    return fp.toStringAsFixed(2);
  }
}
