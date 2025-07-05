/// Firestoreのコレクション名やフィールド名を管理する定数クラス
class FirestoreConstants {
  FirestoreConstants._();

  // コレクション名
  static const usersCollection = 'users';
  static const subscriptionsCollection = 'subscriptions';

  // フィールド名
  static const createdAtField = 'createdAt';
  static const updatedAtField = 'updatedAt';
  static const tokenField = 'token';
  static const timezoneField = 'timezone';
  static const timezoneNameField = 'name';
  static const timezoneOffsetField = 'offset';
  static const reminderField = 'reminder';
  static const isEnabled = 'isEnabled';
  static const daysBeforeField = 'daysBefore';
  static const hourField = 'hour';
}
