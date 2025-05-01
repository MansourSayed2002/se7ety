import 'package:flutter/material.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';

extension AletrDialog on BuildContext {
  alertConfirme({
    required String title,
    required String content,
    required VoidCallback onConfirme,
    required VoidCallback onCancel,
  }) => showDialog(
    context: this,
    builder:
        (context) => AlertDialog.adaptive(
          backgroundColor: ColorApp.third,
          title: Center(
            child: Text(title, style: getBodyStyle(color: ColorApp.primery)),
          ),
          content: Text(content, style: getBodyStyle()),
          actions: [
            TextButton(
              onPressed: onCancel,
              child: Text(
                TextApp.no,
                style: getSmallStyle(color: ColorApp.red),
              ),
            ),
            TextButton(
              onPressed: onConfirme,
              child: Text(
                TextApp.yes,
                style: getSmallStyle(color: ColorApp.primery),
              ),
            ),
          ],
        ),
  );
}
