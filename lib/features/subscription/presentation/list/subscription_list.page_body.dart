import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subrisu/components/loading_indicator.dart';
import 'package:subrisu/features/subscription/data/subscriptions_provider.dart';
import 'package:subrisu/features/subscription/presentation/list/widgets/no_subscription.dart';
import 'package:subrisu/features/subscription/presentation/list/widgets/subrisu_image.dart';
import 'package:subrisu/features/subscription/presentation/list/widgets/subscription_list.dart';
import 'package:subrisu/l10n/app_localizations.dart';

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
