import '../../../../../importer.dart';

/// アイコン画像選択ダイアログを呼び出すボタン
class SelectSubscriptionIconButton extends ConsumerWidget {
  const SelectSubscriptionIconButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultIconImagePath =
        ref.watch(subscriptionFormNotifierProvider).resultIconImagePath;

    return GestureDetector(
      onTap: () {
        if (resultIconImagePath.isEmpty) {
          ref
              .read(subscriptionFormNotifierProvider.notifier)
              .setSelectedIconImagePath('');
        } else {
          ref
              .read(subscriptionFormNotifierProvider.notifier)
              .setSelectedIconImagePath(resultIconImagePath);
        }

        showDialog<void>(
          context: context,
          builder: (_) => const SelectSubscriptionIconDialog(),
        );
      },
      child: resultIconImagePath.isEmpty
          ? DottedBorder(
              padding: EdgeInsets.zero,
              color: AppColors.primary,
              borderType: BorderType.Circle,
              dashPattern: const [8, 4],
              child: SizedBox(
                height: 60.h,
                width: 60.h,
                child: const Icon(
                  Icons.add,
                  color: AppColors.primary,
                ),
              ),
            )
          : Container(
              height: 60.h,
              width: 60.h,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary),
                shape: BoxShape.circle,
              ),
              child: ColorFiltered(
                colorFilter:
                    const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                child: Image.asset(resultIconImagePath),
              ),
            ),
    );
  }
}
