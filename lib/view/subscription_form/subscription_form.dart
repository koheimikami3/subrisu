import '../../importer.dart';

class SubscriptionForm extends StatelessWidget {
  const SubscriptionForm({
    Key? key,
    this.subscriptionDoc,
    this.serviceName = '',
    this.price = '',
    required this.button,
  }) : super(key: key);

  final DocumentSnapshot? subscriptionDoc; // サブスクリプションドキュメント
  final String serviceName;
  final String price;
  final Widget button; // 登録・更新ボタン

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                ServiceInfo(serviceName: serviceName, price: price),
                SizedBox(height: 25.h),
                const DetailInfo(),
                SizedBox(height: 25.h),
                const MemoForm(),
                SizedBox(height: 30.h),
                button,
                SizedBox(height: 30.h),
              ],
            ),
          ),
          SizedBox(width: 20.w),
        ],
      ),
    );
  }
}
