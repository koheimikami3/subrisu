import '../../../../../importer.dart';

/// サブスクリプション一覧画面のScaffoldBody
class SubscriptionListPageBody extends ConsumerWidget {
  const SubscriptionListPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSubscriptions = ref.watch(subscriptionsProvider);

    return asyncSubscriptions.when(
      loading: () => const Center(child: LoadingIndicator()),
      error: (_, __) => _error(context),
      data: (subscriptions) {
        return subscriptions.isEmpty
            ? const Center(child: NoSubscription())
            : SubscriptionList(subscriptions: subscriptions);
      },
    );
  }

  Widget _error(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SubrisuImage(color: Colors.red),
          Text(
            AppLocalizations.of(context)!.fetchSubscriptionsError,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
