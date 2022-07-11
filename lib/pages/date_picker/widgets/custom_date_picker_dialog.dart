import 'package:flutter/material.dart';
import 'package:flutter_workspace/common/extensions/date_extension.dart';

import 'custom_calender_date_picker.dart';

class CustomDatePickerDialog extends StatefulWidget {
  const CustomDatePickerDialog({
    Key? key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
  }) : super(key: key);

  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  static Future<DateTime?> show(BuildContext context,
      {required DateTime initialDate,
      required DateTime firstDate,
      required DateTime lastDate}) async {
    final result = await showDialog<DateTime?>(
        context: context,
        builder: (context) {
          return CustomDatePickerDialog(
            initialDate: initialDate,
            firstDate: firstDate,
            lastDate: lastDate,
          );
        });
    return result;
  }

  @override
  State<CustomDatePickerDialog> createState() => _CustomDatePickerDialogState();
}

class _CustomDatePickerDialogState extends State<CustomDatePickerDialog> {
  DateTime date = DateTime.now();

  @override
  void initState() {
    date = widget.initialDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(date.format(pattern: 'yyyy M月dd日(E)', useJapaneseEra: true)),
            CustomCalendarDatePicker(
                initialDate: widget.initialDate,
                firstDate: widget.firstDate,
                lastDate: widget.lastDate,
                onDateChanged: (value) {
                  setState(() {
                    date = value;
                  });
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: Navigator.of(context).pop,
                    child: const Text('キャンセル')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(date);
                    },
                    child: const Text('決定')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
