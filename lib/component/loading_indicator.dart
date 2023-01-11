import '../importer.dart';

class LoadingIndicator extends ConsumerWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(25.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isDark ? Colors.grey.shade400 : Colors.white,
          ),
          child: const CircularIndicator(),
        ),
      ],
    );
  }
}
