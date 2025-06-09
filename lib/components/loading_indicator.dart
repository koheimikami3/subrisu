import '../importer.dart';

/// データ取得中を知らせるインジケーター
class LoadingIndicator extends ConsumerWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSetting = ref.watch(themeSettingNotifierProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(25.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: selectColor(
              context: context,
              themeSetting: themeSetting,
              lightColor: Colors.grey.shade200,
              darkColor: Colors.grey.shade400,
            ),
          ),
          child: const CircularProgressIndicator(),
        ),
      ],
    );
  }
}
