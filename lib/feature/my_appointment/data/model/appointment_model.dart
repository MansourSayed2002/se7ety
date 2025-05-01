class AppointmentModel {
  String? doctorId;
  String? doctorName;
  String? patientId;
  bool? isComplete;
  String? location;
  String? patientName;
  String? patientPhone;
  String? patientDescription;
  String? date;
  String? time;
  num? rating;

  AppointmentModel({
    this.doctorId,
    this.patientId,
    this.isComplete,
    this.location,
    this.patientName,
    this.patientPhone,
    this.patientDescription,
    this.date,
    this.rating,
  });

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctorId'];
    doctorName = json['doctorName'];
    patientId = json['patientId'];
    isComplete = json['isComplete'];
    location = json['location'];
    patientName = json['patientName'];
    patientPhone = json['patientPhone'];
    patientDescription = json['patientDescription'];
    date = json['date'];
    time = json['time'];
    rating = json['rating'];
  }
}
