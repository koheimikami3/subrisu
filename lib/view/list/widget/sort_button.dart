import 'package:flutter/cupertino.dart';

import '../../../constant/configs.dart' as configs;
import '../../../importer.dart';

/// 並び替えボタン
class SortButton extends ConsumerWidget {
  const SortButton({super.key});

  static final _prefs = GetIt.I<SharedPreferences>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortIndex = ref.watch(listSortProvider);

    return Row(
      children: [
        PullDownButton(
          itemBuilder: (context) {
            return [
              const PullDownMenuTitle(title: Text('並び替え')),
              const PullDownMenuDivider(),
              PullDownMenuItem.selectable(
                title: '支払い日が近い順',
                selected: sortIndex == 0,
                itemTheme: const PullDownMenuItemTheme(
                  checkmark: Icons.check,
                ),
                onTap: () {
                  _prefs.setInt(configs.listSortKey, 0);
                  ref.read(listSortProvider.notifier).state = 0;
                },
              ),
              const PullDownMenuDivider(),
              PullDownMenuItem.selectable(
                title: '料金が安い順',
                selected: sortIndex == 1,
                itemTheme: const PullDownMenuItemTheme(
                  checkmark: Icons.check,
                ),
                onTap: () {
                  _prefs.setInt(configs.listSortKey, 1);
                  ref.read(listSortProvider.notifier).state = 1;
                },
              ),
              const PullDownMenuDivider(),
              PullDownMenuItem.selectable(
                title: '料金が高い順',
                selected: sortIndex == 2,
                itemTheme: const PullDownMenuItemTheme(
                  checkmark: Icons.check,
                ),
                onTap: () {
                  _prefs.setInt(configs.listSortKey, 2);
                  ref.read(listSortProvider.notifier).state = 2;
                },
              ),
              const PullDownMenuDivider(),
              PullDownMenuItem.selectable(
                title: '名前順（昇順）',
                selected: sortIndex == 3,
                itemTheme: const PullDownMenuItemTheme(
                  checkmark: Icons.check,
                ),
                onTap: () {
                  _prefs.setInt(configs.listSortKey, 3);
                  ref.read(listSortProvider.notifier).state = 3;
                },
              ),
              const PullDownMenuDivider(),
              PullDownMenuItem.selectable(
                title: '名前順（降順）',
                selected: sortIndex == 4,
                itemTheme: const PullDownMenuItemTheme(
                  checkmark: Icons.check,
                ),
                onTap: () {
                  _prefs.setInt(configs.listSortKey, 4);
                  ref.read(listSortProvider.notifier).state = 4;
                },
              ),
            ];
          },
          buttonBuilder: (context, showMenu) {
            return GestureDetector(
              onTap: () => showMenu(),
              child: Icon(
                CupertinoIcons.arrow_up_arrow_down_circle_fill,
                size: 25.h,
              ),
            );
          },
        ),
        SizedBox(width: 20.w),
      ],
    );
  }
}
