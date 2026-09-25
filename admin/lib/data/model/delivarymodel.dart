class DelivaryModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? aproove;
  String? verifyCode;
  String? created;

  DelivaryModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.aproove,
    this.verifyCode,
    this.created,
  });

  factory DelivaryModel.fromJson(Map<String, dynamic> json) {
    return DelivaryModel(
      id: json['delivary_id'].toString(),
      name: json['delivary_name'],
      email: json['delivary_email'],
      phone: json['delivary_phone'],
      password: json['delivary_password'],
      aproove: json['delivary_aproove'].toString(),
      verifyCode: json['delivary_verifyicode'].toString(),
      created: json['delivary_create'],
    );
  }
}
