import 'package:flutter/cupertino.dart';

import '../../../../importer.dart';

/// リマインダーの「何日前に通知するか」を選択するボタン
class SelecetDaysBeforeButton extends ConsumerWidget {
  const SelecetDaysBeforeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultDaysBefore = ref.watch(
      reminderSettingsPageNotiferProvider
          .select((state) => state.resultDaysBefore),
    );

    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (_) {
            return const CupertinoPickerSheet(
              picker: ReminderDaysBeforePicker(),
              saveButton: SaveReminderDaysBeforeButton(),
            );
          },
        );
      },
      child: Row(
        children: [
          Text(AppLocalizations.of(context)!
              .reminderDaysBefore(resultDaysBefore.toString())),
          Icon(
            Icons.unfold_more,
            color: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }
}
