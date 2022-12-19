import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// アカウント連携画面のUIを作成する
class LinkAccountPage extends ConsumerWidget {
  const LinkAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(texts.linkAccountPage),
      ),
      body: Row(
        children: [
          SizedBox(width: 25.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                const Text('アカウント連携を行うことで'),
                const Text('①アプリを削除してもデータを復元できます'),
                const Text('②機種変更した際にデータを移行できます'),
                const Text('③複数端末でのデータ管理が可能です'),
                SizedBox(height: 30.h),
                const CreateAppleUserButton(),
                SizedBox(height: 20.h),
                const LinkGoogleUserButton(),
              ],
            ),
          ),
          SizedBox(width: 25.w),
        ],
      ),
    );
  }
}
