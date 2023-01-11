import '../../importer.dart';

/// ログイン画面のUIを作成する
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            SizedBox(width: 25.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: 50.h),
                  // _appName(),
                  // SizedBox(height: 10.h),
                  // _catchphrase(),
                  // SizedBox(height: 20.h),
                  // _splashImage(),
                  // SizedBox(height: 40.h),
                  const CreateAppleUserButton(),
                  SizedBox(height: 20.h),
                  const CreateGoogleUserButton(),
                  SizedBox(height: 20.h),
                  const CreateAnonymousUserButton(),
                ],
              ),
            ),
            SizedBox(width: 25.w),
          ],
        ),
      ),
    );
  }

  /// アプリ名を表示する
  // Text _appName() {
  //   const text = 'サブリス';

  //   return Text(
  //     text,
  //     style: TextStyle(
  //       fontSize: 28.sp,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   );
  // }

  // /// スプラッシュ画像を表示する
  // SizedBox _splashImage() {
  //   return SizedBox(
  //     height: 160.h,
  //     width: 160.w,
  //     child: Image.asset(paths.splashPath),
  //   );
  // }

  /// キャッチフレーズを表示する
  // Text _catchphrase() {
  //   const text = 'サブスクリプションをリストで管理';

  //   return Text(
  //     text,
  //     style: TextStyle(fontSize: 17.sp),
  //   );
  // }
}
