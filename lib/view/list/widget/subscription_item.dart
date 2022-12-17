import '../../../constant/configs.dart' as configs;
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
    return Container(
      height: 55.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
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
    );
  }

  /// アイコン画像を表示する
  Widget _iconImage() {
    late String imagePath;
    imagePath = subscriptionDoc.get('iconImagePath');

    if (imagePath == '') imagePath = 'images/icon/squirrel.png';

    return ColorFiltered(
      colorFilter: const ColorFilter.mode(configs.appColor, BlendMode.srcIn),
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
        fontSize: 15.sp,
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
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
