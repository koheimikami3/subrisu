import '../../../constant/configs.dart' as configs;
import '../../../importer.dart';

/// アイコン画像選択ダイアログを呼び出すボタン
class IconSelectButton extends StatelessWidget {
  const IconSelectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: configs.appColor,
      borderType: BorderType.Circle,
      dashPattern: const [8, 4],
      child: SizedBox(
        height: 55.h,
        width: 55.h,
        child: const Icon(
          Icons.add,
          color: configs.appColor,
        ),
      ),
    );
  }
}
