import '../../../../../constant/colors.dart' as colors;
import '../../../../../importer.dart';

class UpdateContentsDialog extends ConsumerWidget {
  const UpdateContentsDialog({
    super.key,
    required this.version,
    required this.contents,
  });

  final String version; // バージョン
  final String contents; // アップデート内容

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeNotifierProvider);

    return AlertDialog(
      insetPadding: EdgeInsets.all(20.w),
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      content: SizedBox(
        height: 300.h,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: 45.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color:
                    isDarkMode ? colors.darkBackgroundColor : colors.appColor,
              ),
              child: Center(child: _title()),
            ),
            Expanded(
              child: Row(
                children: [
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        Text('バージョン$version'),
                        SizedBox(height: 10.h),
                        Text(contents),
                        SizedBox(height: 20.h),
                        const Text('引き続きサブリスをよろしくお願いします。'),
                        SizedBox(height: 20.h),
                        _closeButton(context, ref),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ダイアログのタイトルを表示する
  Widget _title() {
    const text = 'アップデート内容';

    return Text(
      text,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _closeButton(BuildContext context, WidgetRef ref) {
    return MyCupertinoButton(
      text: '閉じる',
      onPressed: () => Navigator.pop(context),
    );
  }
}
