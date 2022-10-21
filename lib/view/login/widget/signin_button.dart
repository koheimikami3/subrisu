import 'package:flutter/cupertino.dart';
import 'package:subrisu/importer.dart';

/// Googleでサインインするボタン
class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
    required this.iconImagePath,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.border,
    required this.onPressed,
  }) : super(key: key);

  final String iconImagePath; // アイコン画像のパス
  final String text; // ボタンのテキスト
  final Color textColor; // テキストの色
  final Color backgroundColor; // ボタンの背景色
  final BoxBorder? border; // ボタンの枠線
  final VoidCallback onPressed; // ボタンタップ時の動作

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      decoration: BoxDecoration(
        border: border,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: SizedBox.expand(
        child: CupertinoButton(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          padding: EdgeInsets.zero,
          color: backgroundColor,
          onPressed: onPressed,
          child: Row(
            children: [
              SizedBox(width: 50.w),
              Expanded(
                child: Row(
                  children: [
                    _iconImage(),
                    SizedBox(width: 12.w),
                    _text(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// アイコン画像を表示する
  Image _iconImage() => Image.asset(iconImagePath);

  /// ボタンのテキストを表示する
  Text _text() {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    );
  }
}
