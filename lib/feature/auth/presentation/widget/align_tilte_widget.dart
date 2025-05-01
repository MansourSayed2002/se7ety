import 'package:flutter/material.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';

class AlignTilteWidget extends StatelessWidget {
  const AlignTilteWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(title, style: getBodyStyle(fontWeight: FontWeight.w400)),
    );
  }
}
