import 'package:flutter/cupertino.dart';
import 'package:se7ety/core/extensions/alert_rating.dart';
import 'package:se7ety/feature/home/data/repo/home_repo.dart';

handlingRating(String document, BuildContext context) {
  if (document.isNotEmpty) {
    context.alertRating(
      onRatingUpdate: (rating) {
        HomeRepo.updateRating(document, rating);
      },
    );
  }
}

calculatingClients(List clients) {
  int member = 0;
  for (var i = 0; i < clients.length; i++) {
    member++;
  }
  return member;
}

calculatingRating(List clients) {
  num total = 0;
  for (var i = 0; i < clients.length; i++) {
    total = total + clients[i]["rating"];
  }
  return total;
}
