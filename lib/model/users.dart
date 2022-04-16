import 'dart:convert';

class Users {
  String name;
  String phone;
  String email;
  String cnic;

  ///
  Users({
    required this.name,
    required this.phone,
    required this.email,
    required this.cnic,
  });

  Users.empty({
    this.name = '',
    this.phone = '',
    this.email = '',
    this.cnic = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'cnic': cnic,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      cnic: map['cnic'] ?? '',
    );
  }

  factory Users.fromJson(String json) => jsonDecode(json);

  toJson() => jsonEncode(toMap());
}
