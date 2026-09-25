// class ItemsModel {
//   String? itemsId;
//   String? itemsName;
//   String? itemsNameAr;
//   String? itemsDesc;
//   String? itemsDescAr;
//   String? itemsImage;
//   String? itemsCount;
//   String? itemsActive;
//   String? itemsPrice;
//   String? itemsDiscount;
//   String? itemspricediscount;
//   String? itemsDate;
//   String? itemsCat;
//   String? categoriesId;
//   String? categoriesName;
//   String? categoriesNamaAr;
//   String? categoriesImage;
//   String? categoriesDatetime;
//   String? favorite ;
//
//   ItemsModel(
//       {this.itemsId,
//         this.itemsName,
//         this.itemsNameAr,
//         this.itemsDesc,
//         this.itemsDescAr,
//         this.itemsImage,
//         this.itemsCount,
//         this.itemsActive,
//         this.itemsPrice,
//         this.itemsDiscount,
//         this.itemspricediscount,
//         this.itemsDate,
//         this.itemsCat,
//         this.categoriesId,
//         this.categoriesName,
//         this.categoriesNamaAr,
//         this.categoriesImage,
//         this.categoriesDatetime,
//         this.favorite,
//
//       });
//
//   ItemsModel.fromJson(Map<String, dynamic> json) {
//     itemsId = json['items_id'];
//     itemsName = json['items_name'];
//     itemsNameAr = json['items_name_ar'];
//     itemsDesc = json['items_desc'];
//     itemsDescAr = json['items_desc_ar'];
//     itemsImage = json['items_image'];
//     itemsCount = json['items_count'];
//     itemsActive = json['items_actives'];
//     itemsPrice = json['items_price'];
//     itemsDiscount = json['items_discount'];
//     itemspricediscount = json['itemspricediscount'];
//     itemsDate = json['items_date'];
//     itemsCat = json['items_cat'];
//     categoriesId = json['categories_id'];
//     categoriesName = json['categories_name'];
//     categoriesNamaAr = json['categories_nama_ar'];
//     categoriesImage = json['categories_image'];
//     categoriesDatetime = json['categories_datetime'];
//     favorite = json['favorite'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['items_id'] = this.itemsId;
//     data['items_name'] = this.itemsName;
//     data['items_name_ar'] = this.itemsNameAr;
//     data['items_desc'] = this.itemsDesc;
//     data['items_desc_ar'] = this.itemsDescAr;
//     data['items_image'] = this.itemsImage;
//     data['items_count'] = this.itemsCount;
//     data['items_actives'] = this.itemsActive;
//     data['items_price'] = this.itemsPrice;
//     data['items_discount'] = this.itemsDiscount;
//     data['items_date'] = this.itemsDate;
//     data['items_cat'] = this.itemsCat;
//     data['categories_id'] = this.categoriesId;
//     data['categories_name'] = this.categoriesName;
//     data['categories_nama_ar'] = this.categoriesNamaAr;
//     data['categories_image'] = this.categoriesImage;
//     data['categories_datetime'] = this.categoriesDatetime;
//     return data;
//   }
// }
class ItemsModel {
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemspricediscount;
  String? itemsDate;
  String? itemsCat;
  String? categoriesId;
  String? categoriesName;
  String? categoriesNamaAr;
  String? categoriesImage;
  String? categoriesDatetime;
  String? favorite;
  String? itemsColors;  // <-- إضافة خاصية الألوان


  ItemsModel({
    this.itemsId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsDesc,
    this.itemsDescAr,
    this.itemsImage,
    this.itemsCount,
    this.itemsActive,
    this.itemsPrice,
    this.itemsDiscount,
    this.itemspricediscount,
    this.itemsDate,
    this.itemsCat,
    this.categoriesId,
    this.categoriesName,
    this.categoriesNamaAr,
    this.categoriesImage,
    this.categoriesDatetime,
    this.favorite,
    this.itemsColors,   // إضافة في الكونستركتور

  });

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id']?.toString();
    itemsName = json['items_name']?.toString();
    itemsNameAr = json['items_name_ar']?.toString();
    itemsDesc = json['items_desc']?.toString();
    itemsDescAr = json['items_desc_ar']?.toString();
    itemsImage = json['items_image']?.toString();
    itemsCount = json['items_count']?.toString();
    itemsActive = json['items_actives']?.toString();
    itemsPrice = json['items_price']?.toString();
    itemsDiscount = json['items_discount']?.toString();
    itemspricediscount = json['itemspricediscount']?.toString();
    itemsDate = json['items_date']?.toString();
    itemsCat = json['items_cat']?.toString();
    categoriesId = json['categories_id']?.toString();
    categoriesName = json['categories_name']?.toString();
    categoriesNamaAr = json['categories_name_ar']?.toString();
    categoriesImage = json['categories_image']?.toString();
    categoriesDatetime = json['categories_datetime']?.toString();
    favorite = json['favorite']?.toString();
    itemsColors = json['items_colors']?.toString() ?? '';

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_actives'] = itemsActive;
    data['items_price'] =itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['itemspricediscount'] = itemspricediscount;
    data['items_date'] = itemsDate;
    data['items_cat'] = itemsCat;
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_name_ar'] = categoriesNamaAr;
    data['categories_image'] = categoriesImage;
    data['categories_datetime'] = categoriesDatetime;
    data['favorite'] = favorite;
    data['items_colors'] = itemsColors;

    return data;
  }
}
