import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subrisu/components/checked_icon.dart';
import 'package:subrisu/components/my_list_tile.dart';
import 'package:subrisu/enums/currency_settings.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/l10n/app_localizations.dart';
import 'package:subrisu/providers/currency_settings_provider.dart';

/// 通貨を変更するタイル
class SelectCurrencyTile extends ConsumerWidget {
  const SelectCurrencyTile({
    super.key,
    required this.position,
    required this.currencySettings,
  });

  final TilePosition position;
  final CurrencySettings currencySettings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCurrencySettings =
        ref.watch(currencySettingsNotifierProvider);

    return MyListTile(
      position: position,
      name: AppLocalizations.of(context)!.currency(currencySettings.code),
      trailing:
          CheckedIcon(isChecked: selectedCurrencySettings == currencySettings),
      onTap: () {
        ref
            .read(currencySettingsNotifierProvider.notifier)
            .set(currencySettings);
      },
    );
  }
}
