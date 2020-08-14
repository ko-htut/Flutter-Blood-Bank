// To parse this JSON data, do
//
//     final donarList = donarListFromJson(jsonString);

import 'dart:convert';

DonarList donarListFromJson(String str) => DonarList.fromJson(json.decode(str));

String donarListToJson(DonarList data) => json.encode(data.toJson());

class DonarList {
    DonarList({
        this.status,
        this.count,
        this.data,
    });

    bool status;
    int count;
    List<Datum> data;

    factory DonarList.fromJson(Map<String, dynamic> json) => DonarList(
        status: json["status"],
        count: json["count"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.name,
        this.image,
        this.email,
        this.emailVerifiedAt,
        this.password,
        this.phone,
        this.bloodType,
        this.city,
        this.address,
        this.status,
        this.rememberToken,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    String image;
    String email;
    dynamic emailVerifiedAt;
    String password;
    String phone;
    String bloodType;
    String city;
    String address;
    int status;
    dynamic rememberToken;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        password: json["password"],
        phone: json["phone"],
        bloodType: json["blood_type"],
        city: json["city"],
        address: json["address"] == null ? null : json["address"],
        status: json["status"],
        rememberToken: json["remember_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "password": password,
        "phone": phone,
        "blood_type": bloodType,
        "city": city,
        "address": address == null ? null : address,
        "status": status,
        "remember_token": rememberToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
