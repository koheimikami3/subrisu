import '../../importer.dart';

class SubscriptionForm extends StatelessWidget {
  const SubscriptionForm({
    Key? key,
    this.subscriptionDoc,
    this.serviceName = '',
    this.price = '',
    this.paymentCycle,
    this.firstPaidOn,
    required this.button,
  }) : super(key: key);

  final DocumentSnapshot? subscriptionDoc; // サブスクリプションドキュメント
  final String serviceName;
  final String price;
  final int? paymentCycle;
  final DateTime? firstPaidOn;
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
                DetailInfo(
                  paymentCycle: paymentCycle,
                  firstPaidOn: firstPaidOn,
                ),
                SizedBox(height: 25.h),
                const NotificationForm(),
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
