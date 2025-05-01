class DoctorModel {
  String? uid;
  String? name;
  String? image;
  String? phone1;
  String? phone2;
  String? email;
  String? address;
  String? bio;
  String? age;
  String? token;
  num? rating;
  String? specialization;
  String? openHour;
  String? closeHour;
  dynamic lat;
  dynamic long;

  DoctorModel({
    this.name,
    this.email,
    this.bio,
    this.age,
    this.uid,
    this.image,
    this.address,
    this.closeHour,
    this.openHour,
    this.phone1,
    this.phone2,
    this.rating,
    this.specialization,
    this.lat,
    this.long,
    this.token,
  });

  DoctorModel.formJson(Map<String, dynamic> json) {
    bio = json["bio"];
    age = json["age"];
    token = json["token"];
    lat = json["latitude"];
    long = json["longitude"];
    uid = json["uid"];
    name = json["name"];
    rating = json["rating"];
    image = json["image"];
    email = json["email"];
    phone1 = json["phone1"];
    phone2 = json["phone2"];
    address = json["address"];
    openHour = json["openHour"];
    closeHour = json["closeHour"];
    specialization = json["specialization"];
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "bio": bio,
    "age": age,
    "uid": uid,
    "token": token,
    "image": image,
    "phone1": phone1,
    "phone2": phone2,
    "address": address,
    "openHour": openHour,
    "closeHour": closeHour,
    "specialization": specialization,
    "rating": rating,
    "latitude": lat,
    "longitude": long,
  };
}
