import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// サービス名フォームを表示する
class ServiceNameForm extends ConsumerWidget {
  const ServiceNameForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyTextField(
      hintText: texts.serviceNameHint,
      onChanged: (value) {
        ref.watch(serviceNameProvider.notifier).state = value;
      },
    );
  }
}
