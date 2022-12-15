import '../../../importer.dart';

/// サービス名フォームを表示する
class ServiceNameForm extends ConsumerWidget {
  const ServiceNameForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 10.w),
            const Text(
              'サービス名',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              '*',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        SizedBox(
          child: TextField(
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.grey.shade200,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              ref.watch(serviceNameProvider.notifier).state = value;
            },
          ),
        ),
      ],
    );
  }
}
