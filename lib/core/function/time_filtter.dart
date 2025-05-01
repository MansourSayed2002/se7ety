String timeFiltter(String timestamp) {
  int time = int.parse(timestamp.split(":").first);
  if (time > 12) {
    return "${(time - 12)}:00";
  } else {
    return "$time:00";
  }
}

compareDate(String date) {
  if (date.compareTo(DateTime.now().toString().split(" ").first) == 0) {
    return true;
  } else {
    return false;
  }
}
