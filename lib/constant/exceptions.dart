const createSubscription = 'createSubscription';
const updateSubscription = 'updateSubscription';
const deleteSubscription = 'deleteSubscription';
const openReview = 'openReview';
const noPurchaseItem = 'noPurchaseItem';
const noPurchaseData = 'noPurchaseData';
const purchase = 'purchase';
const restore = 'restore';

const messageMap = {
  createSubscription: 'サブスクリプションデータを登録できませんでした。時間をおいて再度お試しください。',
  updateSubscription: 'サブスクリプションデータを更新できませんでした。時間をおいて再度お試しください。',
  deleteSubscription: 'サブスクリプションデータを削除できませんでした。時間をおいて再度お試しください。',
  openReview: 'レビュー画面を開けませんでした。',
  noPurchaseItem: '購入可能なアイテムが見つかりませんでした。',
  noPurchaseData: '過去の購入情報が見つかりませんでした。購入を行ったアカウントをご確認ください。',
  purchase: '購入処理を完了できませんでした。',
  restore: '復元処理を完了できませんでした。',
};
