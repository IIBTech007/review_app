// To parse this JSON data, do
//
//     final allBusiness = allBusinessFromJson(jsonString);

import 'dart:convert';



class AllBusiness {
 static List<AllBusiness> allBusinessFromJson(String str) => List<AllBusiness>.from(json.decode(str).map((x) => AllBusiness.fromJson(x)));

  //String allBusinessToJson(List<AllBusiness> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
  AllBusiness({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.description,
    this.longitude,
    this.latitude,
    this.address,
    this.openingTime,
    this.closingTime,
    this.ownerId,
    this.parentBusinessId,
    this.image,
    this.qrimage,
    this.overallRating,
    this.isVisible,
    this.businessTypeId,
    this.businessType,
  });

  int id;
  String name;
  String phone;
  String email;
  String description;
  int longitude;
  int latitude;
  String address;
  String openingTime;
  String closingTime;
  String ownerId;
  dynamic parentBusinessId;
  String image;
  dynamic qrimage;
  int overallRating;
  bool isVisible;
  int businessTypeId;
  dynamic businessType;

  factory AllBusiness.fromJson(Map<String, dynamic> json) => AllBusiness(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    phone: json["phone"] == null ? null : json["phone"],
    email: json["email"] == null ? null : json["email"],
    description: json["description"] == null ? null : json["description"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    address: json["address"] == null ? null : json["address"],
    openingTime: json["openingTime"] == null ? null : json["openingTime"],
    closingTime: json["closingTime"] == null ? null : json["closingTime"],
    ownerId: json["ownerId"] == null ? null : json["ownerId"],
    parentBusinessId: json["parentBusinessId"],
    image: json["image"] == null ? null : json["image"],
    qrimage: json["qrimage"],
    overallRating: json["overallRating"] == null ? null : json["overallRating"],
    isVisible: json["isVisible"] == null ? null : json["isVisible"],
    businessTypeId: json["businessTypeId"] == null ? null : json["businessTypeId"],
    businessType: json["businessType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "phone": phone == null ? null : phone,
    "email": email == null ? null : email,
    "description": description == null ? null : description,
    "longitude": longitude == null ? null : longitude,
    "latitude": latitude == null ? null : latitude,
    "address": address == null ? null : address,
    "openingTime": openingTime == null ? null : openingTime,
    "closingTime": closingTime == null ? null : closingTime,
    "ownerId": ownerId == null ? null : ownerId,
    "parentBusinessId": parentBusinessId,
    "image": image == null ? null : image,
    "qrimage": qrimage,
    "overallRating": overallRating == null ? null : overallRating,
    "isVisible": isVisible == null ? null : isVisible,
    "businessTypeId": businessTypeId == null ? null : businessTypeId,
    "businessType": businessType,
  };
}
