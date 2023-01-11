import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// サービス名フォームを表示する
class ServiceNameForm extends ConsumerWidget {
  const ServiceNameForm({
    super.key,
    this.serviceName,
  });

  final String? serviceName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyTextFormField(
      initialValue: serviceName,
      hintText: texts.serviceNameHint,
      onChanged: (value) {
        ref.watch(serviceNameProvider.notifier).state = value;
      },
    );
  }
}
