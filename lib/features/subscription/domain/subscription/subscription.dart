import '../../../../importer.dart';

part 'subscription.freezed.dart';

/// SubscriptionDocumentのデータを格納するモデルクラス
@freezed
abstract class Subscription implements _$Subscription {
  const factory Subscription({
    // ドキュメントID
    required String id,

    // サービス名
    required String serviceName,

    // 価格
    required String price,

    // アイコン画像パス
    required String iconImagePath,

    // 支払い周期
    required PaymentCycle paymentCycle,

    // 初回支払日
    required Timestamp firstPaidOn,

    // 通知フラグ
    required bool notification,

    // メモ
    required String memo,

    // 作成日
    required Timestamp createdAt,
  }) = _Subscription;
  const Subscription._();

  factory Subscription.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? _,
  ) {
    final data = snapshot.data()!;
    return Subscription(
      id: snapshot.id,
      serviceName: snapshot['serviceName'] as String,
      price: data['price'] as String,
      iconImagePath: data['iconImagePath'] as String,
      paymentCycle: PaymentCycle.values[data['paymentCycle'] as int],
      firstPaidOn: data['firstPaidOn'] as Timestamp,
      notification: data['notification'] as bool,
      memo: data['memo'] as String,
      createdAt: data['createdAt'] as Timestamp,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'serviceName': serviceName,
      'price': price,
      'iconImagePath': iconImagePath,
      'paymentCycle': paymentCycle,
      'firstPaidOn': firstPaidOn,
      'notification': notification,
      'memo': memo,
      'createdAt': createdAt,
    };
  }
}
