import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../../importer.dart';

/// リマインダーの「何時に通知するか」を選択するボタン
class SelectHourButton extends ConsumerWidget {
  const SelectHourButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultHour = ref.watch(
      reminderSettingsPageNotiferProvider.select((state) => state.resultHour),
    );

    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (_) {
            return const CupertinoPickerSheet(
              picker: ReminderHourPicker(),
              saveButton: SaveReminderHourButton(),
            );
          },
        );
      },
      child: Row(
        children: [
          Text(DateFormat('HH:00').format(DateTime(0, 0, 0, resultHour))),
          Icon(
            Icons.unfold_more,
            color: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }
}
