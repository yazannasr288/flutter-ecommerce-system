class Delivarypricemodel {
  String? delivarypriceid;
  String? delivaryprice;


  Delivarypricemodel(
      {this.delivarypriceid,
        this.delivaryprice,
       });

  Delivarypricemodel.fromJson(Map<String, dynamic> json) {
    delivarypriceid = json['delivaryprice_id'].toString();
    delivaryprice = json['delivaryprice_price'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivaryprice_id'] = this.delivarypriceid;
    data['delivaryprice_price'] = this.delivaryprice;

    return data;
  }}
