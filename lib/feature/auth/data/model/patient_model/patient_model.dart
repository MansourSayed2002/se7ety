class PatientModel {
  String? name;
  String? email;
  String? phone;
  String? city;
  String? bio;
  String? age;
  String? uid;
  String? image;

  PatientModel({
    this.name,
    this.email,
    this.phone,
    this.city,
    this.bio,
    this.age,
    this.uid,
    this.image,
  });

  PatientModel.formJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    city = json["city"];
    bio = json["bio"];
    age = json["age"];
    uid = json["uid"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "city": city,
    "bio": bio,
    "age": age,
    "uid": uid,
    "image": image,
  };
}
