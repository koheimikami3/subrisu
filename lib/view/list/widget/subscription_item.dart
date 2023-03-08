import '../../../constant/colors.dart' as colors;
import '../../../importer.dart';

/// サブスクリプションリストのアイテム
class SubscriptionItem extends ConsumerWidget {
  const SubscriptionItem({
    super.key,
    required this.subscriptionDoc,
  });

  final DocumentSnapshot subscriptionDoc; // サブスクリプションドキュメント

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);

    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: isDark ? colors.darkItemColor : Colors.white,
      child: InkWell(
        onTap: () => _onTap(context),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        highlightColor: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
        child: SizedBox(
          height: 57.h,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 5.h),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(width: 15.w),
                    _iconImage(),
                    SizedBox(width: 15.w),
                    Expanded(child: _serviceName()),
                    SizedBox(width: 5.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _price(),
                        NextPaymentDate(subscriptionDoc: subscriptionDoc),
                      ],
                    ),
                    SizedBox(width: 15.w),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }

  /// 編集画面に遷移する
  void _onTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => EditPage(subscriptionDoc: subscriptionDoc),
        fullscreenDialog: true,
      ),
    );
  }

  /// アイコン画像を表示する
  Widget _iconImage() {
    late String imagePath;
    imagePath = subscriptionDoc.get('iconImagePath') as String;

    if (imagePath == '') {
      imagePath = 'images/subscription/subrisu.png';
    }

    return ColorFiltered(
      colorFilter: const ColorFilter.mode(colors.appColor, BlendMode.srcIn),
      child: Image.asset(
        imagePath,
        height: 33.h,
        width: 33.h,
      ),
    );
  }

  /// サービス名を表示する
  Widget _serviceName() {
    final serviceName = subscriptionDoc.get('serviceName') as String;

    return Text(
      serviceName,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 17.sp),
    );
  }

  /// 料金を表示する
  Widget _price() {
    final price = subscriptionDoc.get('price');
    final text = '¥$price';

    return Text(
      text,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
