import '../../../constant/colors.dart' as colors;
import '../../../importer.dart';

/// サブスクリプションリストのアイテムを表示する
class SubscriptionItem extends ConsumerWidget {
  const SubscriptionItem({
    Key? key,
    required this.subscriptionDoc,
  }) : super(key: key);

  final DocumentSnapshot subscriptionDoc; // サブスクリプションドキュメント

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: Colors.white,
      child: InkWell(
        onTap: () => _onTap(context),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        highlightColor: Colors.grey.shade300,
        child: SizedBox(
          height: 60.h,
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
                    _price(),
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
      MaterialPageRoute(
        builder: (_) => EditPage(subscriptionDoc: subscriptionDoc),
        fullscreenDialog: true,
      ),
    );
  }

  /// アイコン画像を表示する
  Widget _iconImage() {
    late String imagePath;
    imagePath = subscriptionDoc.get('iconImagePath');

    if (imagePath == '') imagePath = 'images/icon/squirrel.png';

    return ColorFiltered(
      colorFilter: const ColorFilter.mode(colors.appColor, BlendMode.srcIn),
      child: Image.asset(
        imagePath,
        height: 40.h,
        width: 40.h,
      ),
    );
  }

  /// サービス名を表示する
  Widget _serviceName() {
    final serviceName = subscriptionDoc.get('serviceName');

    return Text(
      serviceName,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
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
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
