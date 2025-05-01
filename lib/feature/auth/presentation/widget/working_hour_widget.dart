import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:se7ety/core/shared/custom_text_from_global.dart';
import 'package:se7ety/core/theme/color_app.dart';

class WorkingHourWidget extends StatefulWidget {
  const WorkingHourWidget({
    super.key,
    required this.controllerOpen,
    required this.controllerclose,
  });
  final TextEditingController controllerOpen;
  final TextEditingController controllerclose;

  @override
  State<WorkingHourWidget> createState() => _WorkingHourWidgetState();
}

class _WorkingHourWidgetState extends State<WorkingHourWidget> {
  String from = DateFormat("HH:mm a").format(DateTime.now());
  String to = DateFormat("HH:mm a").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: CustomTextFromGlobal(
            controller: widget.controllerOpen,
            readOnly: true,
            hinttext: from,
            suffixIcon: IconButton(
              onPressed: () async {
                var time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() {
                    from = time.hour.toString();
                    widget.controllerOpen.text = time.hour.toString();
                  });
                }
              },
              icon: Icon(Icons.access_time, color: ColorApp.primery),
            ),
          ),
        ),
        Gap(14.0),
        Expanded(
          child: CustomTextFromGlobal(
            controller: widget.controllerclose,
            readOnly: true,
            hinttext: to,
            suffixIcon: IconButton(
              onPressed: () async {
                var time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() {
                    from = time.toString();
                    widget.controllerclose.text = time.hour.toString();
                  });
                }
              },
              icon: Icon(Icons.access_time, color: ColorApp.primery),
            ),
          ),
        ),
      ],
    );
  }
}
