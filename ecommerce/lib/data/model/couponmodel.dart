class CoponModel {
  String? coponId;
  String? coponName;
  String? coponCount;
  String? coponDiscount;
  String? copondate;

  CoponModel(
      {this.coponId,
      this.coponName,
      this.coponCount,
      this.coponDiscount,
      this.copondate});

  CoponModel.fromJson(Map<String, dynamic> json) {
    coponId = json['copon_id'].toString();
    coponName = json['copon_name'];
    coponCount = json['copon_count'].toString();
    coponDiscount = json['copon_discount'].toString();
    copondate = json['copon_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['copon_id'] = this.coponId;
    data['copon_name'] = this.coponName;
    data['copon_count'] = this.coponCount;
    data['copon_discount'] = this.coponDiscount;
    data['copon_date'] = this.copondate;
    return data;
  }}
// }class CoponModel {
//   String? coponId;
//   String? coponName;
//   String? coponCount;
//   String? coponDiscount;
//   String? copondate;
//
//   CoponModel({
//     this.coponId,
//     this.coponName,
//     this.coponCount,
//     this.coponDiscount,
//     this.copondate,
//   });
//
//   CoponModel.fromJson(Map<String, dynamic> json) {
//     coponId = json['copon_id']?.toString();
//     coponName = json['copon_name']?.toString();
//     coponCount = json['copon_count']?.toString();
//     coponDiscount = json['copon_discount']?.toString();
//     copondate = json['copon_date']?.toString();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['copon_id'] = coponId;
//     data['copon_name'] = coponName;
//     data['copon_count'] = coponCount;
//     data['copon_discount'] = coponDiscount;
//     data['copon_date'] = copondate;
//     return data;
//   }
// }