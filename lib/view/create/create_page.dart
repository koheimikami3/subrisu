import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// 作成画面のUIを作成する
class CreatePage extends ConsumerWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text(texts.createPage)),
        body: SingleChildScrollView(
          child: Row(
            children: [
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    const ServiceInfo(),
                    SizedBox(height: 25.h),
                    const DetailInfo(),
                    SizedBox(height: 25.h),
                    const MemoForm(),
                    SizedBox(height: 30.h),
                    const RegisterButton(),
                  ],
                ),
              ),
              SizedBox(width: 20.w),
            ],
          ),
        ),
      ),
    );
  }
}
