import '../../../constant/configs.dart' as configs;
import '../../../importer.dart';

/// サービス名フォームを表示する
class ServiceNameForm extends ConsumerWidget {
  const ServiceNameForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      cursorColor: configs.appColor,
      decoration: InputDecoration(
        hintText: 'サービス名',
        hintStyle: TextStyle(fontSize: 14.sp),
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
      onChanged: (value) {
        ref.watch(serviceNameProvider.notifier).state = value;
      },
    );
  }
}
