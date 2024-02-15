import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// サービス名を入力するフォーム
class ServiceNameInputForm extends ConsumerWidget {
  const ServiceNameInputForm({
    super.key,
    this.serviceName,
  });

  final String? serviceName; // サービス名

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyTextFormField(
      initialValue: serviceName,
      hintText: texts.serviceNameHint,
      onChanged: (value) {
        // サービス名の状態を更新
        ref
            .read(subscriptionFormNotifierProvider.notifier)
            .setServiceName(value);
      },
    );
  }
}
