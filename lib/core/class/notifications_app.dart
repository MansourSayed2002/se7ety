import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

class NotificationsApp {
  // It used to Access token to Use send notification
  static Future<String> getAccessToken() async {
    final jsonString = await rootBundle.loadString(
      'assets/json/se7ety-f259f-f3590b91be7a.json',
    );

    final accountCredentials = auth.ServiceAccountCredentials.fromJson(
      jsonString,
    );

    final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];
    final client = await auth.clientViaServiceAccount(
      accountCredentials,
      scopes,
    );
    client.close();
    print(client.credentials.accessToken.data);

    return client.credentials.accessToken.data;
  }

  static Future<void> sendNotification({
    required String token,
    required String title,
    required String body,
  }) async {
    final String accessToken = await getAccessToken();
    final String fcmUrl = dotenv.env['FCM_URL'].toString();

    final response = await http.post(
      Uri.parse(fcmUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(<String, dynamic>{
        'message': {
          'token': token,
          'notification': {'title': title, 'body': body},
        },
      }),
    );

    if (response.statusCode == 200) {
      print('Notification sent successfully');
    } else {
      print('Failed to send notification: ${response.body}');
    }
  }
}
