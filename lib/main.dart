import 'package:flutter/material.dart';
import 'package:se7ety/core/service/services_app.dart';
import 'package:se7ety/se7ety_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesApp.init();
  runApp(const Se7etyApp());
}
