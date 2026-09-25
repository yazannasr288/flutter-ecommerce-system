class Offersmodel {

  String? id;
  String? image;

  Offersmodel(
      {this.id,this.image});

  Offersmodel.fromJson(Map<String, dynamic> json) {
    id = json['surprice_id'].toString();
    image = json['surprice_image'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['surprice_id'] = this.id;
    data['surprice_image'] = this.image;

    return data;
  }}