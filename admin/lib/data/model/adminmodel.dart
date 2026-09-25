class AdminModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? aproove;
  String? verifyCode;
  String? created;

  AdminModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.aproove,
    this.verifyCode,
    this.created,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      id: json['admin_id'].toString(),
      name: json['admin_name'],
      email: json['admin_email'],
      phone: json['admin_phone'],
      password: json['admin_password'],
      aproove: json['admin_aproove'].toString(),
      verifyCode: json['admin_verifyicode'].toString(),
      created: json['admin_create'],
    );
  }
}
