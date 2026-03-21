import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subrisu/components/dialog/my_alert_dialog.dart';
import 'package:subrisu/components/my_list_tile.dart';
import 'package:subrisu/constants/app_urls.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/l10n/app_localizations.dart';
import 'package:subrisu/providers/in_app_review_provider.dart';

/// アプリのレビュー画面を開くタイル
class OpenAppReviewTile extends ConsumerWidget {
  const OpenAppReviewTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyListTile(
      position: TilePosition.top,
      name: AppLocalizations.of(context)!.reviewItem,
      leadingIcon: Icons.rate_review_outlined,
      onTap: () async {
        final inAppReview = ref.read(inAppReviewProvider);

        if (await inAppReview.isAvailable()) {
          await inAppReview.openStoreListing(appStoreId: AppUrls.appStoreId);
        } else {
          if (!context.mounted) {
            return;
          }
          showErrorDialog(
            context,
            AppLocalizations.of(context)!.openReviewError,
          );
        }
      },
    );
  }
}
