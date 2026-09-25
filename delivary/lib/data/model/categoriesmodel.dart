// class CategoriesModel {
//   String? categoriesId;
//   String? categories_name;
//   String? categories_name_ar;
//   String? categoriesImage;
//   String? categoriesDatetime;
//
//   CategoriesModel(
//       {this.categoriesId,
//         this.categories_name,
//         this.categories_name_ar,
//         this.categoriesImage,
//         this.categoriesDatetime});
//
//   CategoriesModel.fromJson(Map<String, dynamic> json) {
//     categoriesId = json['categories_id'];
//     categories_name = json['categories_name'];
//     categories_name_ar = json['categories_name_ar'];
//     categoriesImage = json['categories_image'];
//     categoriesDatetime = json['categories_datetime'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['categories_id'] = this.categoriesId;
//     data['categories_name'] = this.categories_name;
//     data['categories_name_ar'] = this.categories_name_ar;
//     data['categories_image'] = this.categoriesImage;
//     data['categories_datetime'] = this.categoriesDatetime;
//     return data;
//   }
// }
class CategoriesModel {
  String? categoriesId;
  String? categories_name;
  String? categories_name_ar;
  String? categoriesImage;
  String? categoriesDatetime;

  CategoriesModel({
    this.categoriesId,
    this.categories_name,
    this.categories_name_ar,
    this.categoriesImage,
    this.categoriesDatetime,
  });

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id']?.toString();
    categories_name = json['categories_name']?.toString();
    categories_name_ar = json['categories_name_ar']?.toString();
    categoriesImage = json['categories_image']?.toString();
    categoriesDatetime = json['categories_datetime']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['categories_id'] = categoriesId;
    data['categories_name'] = categories_name;
    data['categories_name_ar'] = categories_name_ar;
    data['categories_image'] = categoriesImage;
    data['categories_datetime'] = categoriesDatetime;
    return data;
  }
}
