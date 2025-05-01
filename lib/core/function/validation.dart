validationField(String type, int min, int max, value) {
  if (type == "Phone") {
    if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
      return "من فضلك ادخل الرقم الصحيح";
    }
  }
  if (type == "text") {
    if (!RegExp(r'[a-zA-Z]+|[\u0600-\u06FF]+').hasMatch(value)) {
      return "من فضلك ادخل الاسم الصحيح";
    }
  }
  if (type == "email") {
    if (!RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(value)) {
      return "من فضلك ادخل الايمال الصحيح";
    }
  }
  if (type == "numtext") {
    if (!RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)) {
      return "من فضلك ادخل الارقام الصحيحه";
    }
  }
  if (value.isEmpty) {
    return "لا يمكن ترك الحقل فارغ";
  } else if (value.length > max) {
    return "لا يمكن ان يكون محتوي الحقل اكبر من $max";
  } else if (value.length < min) {
    return "لا يمكن ان يكون محتوي الحقل اصغر من $min";
  }
}
