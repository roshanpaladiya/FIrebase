import 'dart:convert';

List<NewAddUser> newAddUserFromJson(String str) =>
    List<NewAddUser>.from(json.decode(str).map((x) => NewAddUser.fromJson(x)));

String newAddUserToJson(List<NewAddUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewAddUser {
  String? id;
  String? name;
  String? email;
  String? password;
  String? image;
  String? state;
  String? pincode;

  NewAddUser({
    this.id,
    this.name,
    this.email,
    this.password,
    this.image,
    this.state,
    this.pincode,
  });

  factory NewAddUser.fromJson(Map<String, dynamic> json) => NewAddUser(
        id: json["id"],
        name: json["name"],
        email: json['email'],
        password: json["password"],
        image: json["image"],
        state: json["state"],
        pincode: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "image": image,
        "state": state,
        "pincode": pincode,
      };
}
