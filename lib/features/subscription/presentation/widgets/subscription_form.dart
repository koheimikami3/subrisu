import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subrisu/enums/payment_cycle.dart';
import 'package:subrisu/features/subscription/presentation/widgets/detail_info.dart';
import 'package:subrisu/features/subscription/presentation/widgets/memo_input_form.dart';
import 'package:subrisu/features/subscription/presentation/widgets/service_info.dart';

/// サブスクリプションを作成または編集するフォーム
class SubscriptionForm extends StatelessWidget {
  const SubscriptionForm({
    super.key,
    this.serviceName,
    this.price,
    this.paymentCycle,
    this.memo,
    required this.button,
  });

  final String? serviceName; // サービス名の初期値
  final String? price; // 価格の初期値
  final PaymentCycle? paymentCycle; // 支払い周期の初期値
  final String? memo; // メモの初期値
  final Widget button; // 作成または更新ボタン

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
                DetailInfo(paymentCycle: paymentCycle),
                SizedBox(height: 25.h),
                MemoInputForm(memo: memo),
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
