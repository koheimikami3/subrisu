import '../../../../../constant/colors.dart' as colors;
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
        _text(context),
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
  Widget _text(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.noSubscription,
      textAlign: TextAlign.center,
    );
  }
}
