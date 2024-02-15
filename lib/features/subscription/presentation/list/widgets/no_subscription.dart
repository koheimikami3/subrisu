import '../../../../../constant/colors.dart' as colors;
import '../../../../../constant/texts.dart' as texts;
import '../../../../../importer.dart';

/// サブスクリプションが1つも登録されていないことを示すテキストとサブリス画像
class NoSubscription extends StatelessWidget {
  const NoSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _image(),
        _text(),
      ],
    );
  }

  /// サブリス画像
  ///
  /// アプリカラーにして表示する
  ColorFiltered _image() {
    return ColorFiltered(
      colorFilter: const ColorFilter.mode(
        colors.appColor,
        BlendMode.srcIn,
      ),
      child: Image.asset(
        Assets.images.subscription.subrisu.path,
        height: 80.h,
        width: 80.h,
      ),
    );
  }

  /// テキスト
  Widget _text() {
    return const Text(
      texts.noSubscription,
      textAlign: TextAlign.center,
    );
  }
}
