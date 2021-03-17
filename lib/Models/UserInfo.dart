class UserInfo
{
  String id,name,email,phone,city,country;

  UserInfo({this.id, this.name, this.email, this.phone, this.city, this.country});

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
      name: json["name"],
      phone: json["phone"],
      email :json["email"],
      city: json["city"],
      country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone":phone,
    "email":email,
    "city":city,
    "country":country
  };
}