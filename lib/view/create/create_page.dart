import 'package:subrisu/view/create/widget/service_name_form.dart';

import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// 作成画面のUIを作成する
class CreatePage extends ConsumerWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text(texts.createPage)),
      body: Row(
        children: [
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 25.h),
                Row(
                  children: [
                    Container(
                      height: 85.w,
                      width: 85.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 35,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    const Expanded(child: ServiceNameForm()),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 20.w),
        ],
      ),
    );
  }

  /// 画面を閉じるボタン
  Material _closeButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(
          Icons.close,
          color: Colors.black,
        ),
      ),
    );
  }

  /// 画面タイトルを表示する
  Text _title() {
    const text = '新規作成';

    return Text(
      text,
      style: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
