timeAllowedOfReservation(DateTime selectDate, String start, String end) {
  var startHour = int.parse(start);
  var endHour = int.parse(end);

  List<int> hours = [];

  for (var i = startHour; i < endHour; i++) {
    if (selectDate
            .difference(
              DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
              ),
            )
            .inDays !=
        0) {
      hours.add(i);
    } else {
      if (i > DateTime.now().hour) {
        hours.add(i);
      }
    }
  }
  return hours;
}
