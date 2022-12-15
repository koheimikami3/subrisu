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
        body: Row(
          children: [
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 25.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 70.w,
                        width: 70.w,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.grey),
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
                  SizedBox(height: 25.h),
                  const PriceForm(),
                  const Spacer(),
                  const RegisterButton(),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
            SizedBox(width: 20.w),
          ],
        ),
      ),
    );
  }
}
