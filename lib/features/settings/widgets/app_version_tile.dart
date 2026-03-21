import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subrisu/components/my_list_tile.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/l10n/app_localizations.dart';
import 'package:subrisu/providers/package_info_provider.dart';

/// アプリバージョンを表示するタイル
class AppVersionTile extends ConsumerWidget {
  const AppVersionTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.read(packageInfoProvider);

    return MyListTile(
      position: TilePosition.bottom,
      leadingIcon: Icons.info_outline,
      name: AppLocalizations.of(context)!.appVersionItem,
      trailing: Text(packageInfo.version),
    );
  }
}
