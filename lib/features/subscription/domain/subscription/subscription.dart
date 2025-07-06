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
    required num price,

    // アイコン画像パス
    required String iconImagePath,

    // 支払い周期
    required PaymentCycle paymentCycle,

    // 初回支払日
    required Timestamp firstPaidOn,

    // メモ
    required String? note,

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
      price: data['price'] as num,
      iconImagePath: data['iconImagePath'] as String,
      paymentCycle: PaymentCycle.values.byName(data['paymentCycle'] as String),
      firstPaidOn: data['firstPaidOn'] as Timestamp,
      note: data['note'] as String?,
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
      'note': note,
      'createdAt': createdAt,
    };
  }
}
