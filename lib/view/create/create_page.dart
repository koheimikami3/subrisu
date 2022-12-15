import '../../constant/configs.dart' as configs;
import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// 作成画面のUIを作成する
class CreatePage extends ConsumerWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text(texts.createPage)),
        backgroundColor: isDark
            ? configs.darkBackgroundColor
            : configs.settingsBackgroundColor,
        body: SingleChildScrollView(
          child: Row(
            children: [
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    const ItemsTitle(title: '基本情報'),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 15.w),
                          const IconSelectButton(),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: Column(
                              children: [
                                const ServiceNameForm(),
                                Container(
                                  height: 1.h,
                                  color: Colors.grey.shade300,
                                ),
                                const PriceForm(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
