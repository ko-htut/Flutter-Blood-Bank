// To parse this JSON data, do
//
//     final admin = adminFromJson(jsonString);

import 'dart:convert';

Admin adminFromJson(String str) => Admin.fromJson(json.decode(str));

String adminToJson(Admin data) => json.encode(data.toJson());

class Admin {
    Admin({
        this.status,
        this.data,
    });

    bool status;
    Data data;

    factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.phone,
        this.bloodType,
        this.address,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.token,
    });

    int id;
    String name;
    String email;
    DateTime emailVerifiedAt;
    dynamic phone;
    dynamic bloodType;
    dynamic address;
    DateTime createdAt;
    DateTime updatedAt;
    bool status;
    String token;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        phone: json["phone"],
        bloodType: json["blood_type"],
        address: json["address"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: json["status"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "phone": phone,
        "blood_type": bloodType,
        "address": address,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "status": status,
        "token": token,
    };
}
