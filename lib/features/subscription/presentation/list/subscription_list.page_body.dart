import '../../../../../importer.dart';

/// サブスクリプション一覧画面のScaffoldBody
class SubscriptionListPageBody extends ConsumerWidget {
  const SubscriptionListPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLogin = ref.watch(loginProvider);

    return asyncLogin.when(
      loading: () => const Center(child: LoadingIndicator()),
      error: (_, __) => const Center(child: LoginError()),
      data: (_) {
        final asyncSubscriptions = ref.watch(subscriptionsProvider);

        return asyncSubscriptions.when(
          loading: () => const Center(child: LoadingIndicator()),
          error: (_, __) => const Center(child: LoginError()),
          data: (subscriptions) {
            return subscriptions.isEmpty
                ? const Center(child: NoSubscription())
                : SubscriptionList(subscriptions: subscriptions);
          },
        );
      },
    );
  }
}
