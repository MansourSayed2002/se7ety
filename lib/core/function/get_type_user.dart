import 'package:se7ety/core/constants/enum/type_user.dart';
import 'package:se7ety/core/constants/text_app.dart';

getTypeUser(TypeUser typeuser) {
  if (typeuser == TypeUser.doctor) {
    return TextApp.doctor;
  } else {
    return TextApp.patient;
  }
}
