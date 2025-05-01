import 'package:flutter/material.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/auth/data/model/specialization_doc.dart';

class DropSpecializationWidget extends StatefulWidget {
  const DropSpecializationWidget({super.key, required this.controller});
  final TextEditingController controller;
  @override
  State<DropSpecializationWidget> createState() =>
      _DropSpecializationWidgetState();
}

class _DropSpecializationWidgetState extends State<DropSpecializationWidget> {
  var specializ = specialization[0];
  @override
  @override
  void initState() {
    widget.controller.text = specialization[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: ColorApp.third,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: DropdownButton(
        isExpanded: true,
        iconEnabledColor: ColorApp.primery,
        icon: const Icon(Icons.expand_circle_down_outlined),
        value: specializ,
        onChanged: (String? newValue) {
          setState(() {
            specializ = newValue!;
            widget.controller.text = newValue;
          });
        },
        items:
            specialization.map((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value, style: getSmallStyle()),
              );
            }).toList(),
      ),
    );
  }
}
