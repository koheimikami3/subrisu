import '../importer.dart';

class LoadingIndicator extends ConsumerWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeNotifierProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(25.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isDarkMode ? Colors.grey.shade400 : Colors.white,
          ),
          child: const CircularIndicator(),
        ),
      ],
    );
  }
}
