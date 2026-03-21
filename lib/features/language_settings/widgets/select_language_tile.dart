import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subrisu/components/checked_icon.dart';
import 'package:subrisu/components/my_list_tile.dart';
import 'package:subrisu/enums/language_settings.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/l10n/app_localizations.dart';
import 'package:subrisu/providers/language_settings_provider.dart';

/// 言語を変更するタイル
class SelectLanguageTile extends ConsumerWidget {
  const SelectLanguageTile({
    super.key,
    required this.position,
    required this.languageSettings,
  });

  final TilePosition position;
  final LanguageSettings languageSettings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguageSettings =
        ref.watch(languageSettingsNotifierProvider);

    return MyListTile(
      position: position,
      name: AppLocalizations.of(context)!.language(languageSettings.name),
      trailing:
          CheckedIcon(isChecked: selectedLanguageSettings == languageSettings),
      onTap: () {
        ref
            .read(languageSettingsNotifierProvider.notifier)
            .set(languageSettings);
      },
    );
  }
}
