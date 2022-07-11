import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_workspace/pages/date_picker/widgets/custom_date_picker_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_workspace/common/extensions/date_extension.dart';

class DatePickerWorkspacePage extends HookConsumerWidget {
  const DatePickerWorkspacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = useState<DateTime?>(null);
    final selectedEndDate = useState<DateTime?>(null);

    return Scaffold(
      appBar: AppBar(title: const Text('Date Picker')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '選択された日付',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: 
                  selectedDate.value == null && selectedEndDate.value == null
                  ? null
                  : () {
                    selectedDate.value = null;
                    selectedEndDate.value = null;
                },
                child: const Text('リセット'))
              ],
            ),
            Text(
              selectedDate.value?.format(
                      pattern: 'yyyy M月 dd日 (E)', useJapaneseEra: true) ??
                  '未選択',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            if (selectedEndDate.value != null) ...[
              Text(
                  '     ~' +
                      selectedEndDate.value!.format(
                          pattern: 'yyyy M月 dd日 (E)', useJapaneseEra: true),
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold))
            ],
            // Flutter Material
            const SizedBox(
              height: 24,
            ),
            const Text('Flutter Material'),
            ElevatedButton(
                onPressed: () async {
                  final now = DateTime.now();
                  final result = await showDatePicker(
                      context: context,
                      initialDate: now,
                      firstDate: now.add(const Duration(days: -365)),
                      lastDate: now.add(const Duration(days: 365)));
                  if (result != null) {
                    selectedDate.value = result;
                    selectedEndDate.value = null;
                  }
                },
                child: const Text('show')),

            // Custom
            const SizedBox(
              height: 24,
            ),
            const Text('Custom'),
            ElevatedButton(
                onPressed: () async {
                  final now = DateTime.now();
                  final result = await showDialog(
                      context: context,
                      builder: (context) {
                        return CustomDatePickerDialog(
                          initialDate: now,
                          firstDate: now.add(const Duration(days: -365)),
                          lastDate: now.add(const Duration(days: 365)),
                        );
                      });
                  if (result != null) {
                    selectedDate.value = result;
                    selectedEndDate.value = null;
                  }
                },
                child: const Text('show')),

            // SfDateRangePicker
            const SizedBox(
              height: 24,
            ),
            const Text('SfDateRangePicker'),
            ElevatedButton(
                onPressed: () async {
                  final result = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime.now().add(const Duration(days: -365)),
                      lastDate: DateTime.now().add(const Duration(days: 365)));

                  selectedDate.value = result?.start;
                  selectedEndDate.value = result?.end;
                },
                child: const Text('show'))
          ],
        ),
      ),
    );
  }
}
