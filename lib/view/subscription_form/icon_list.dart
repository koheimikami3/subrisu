import '../../constant/colors.dart' as colors;
import '../../importer.dart';

class IconList extends ConsumerWidget {
  const IconList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const list = [
      'images/icon/squirrel.png',
      'images/icon/netflix.png',
      'images/icon/amazon_prime.png',
      'images/icon/disney_plus.png',
    ];

    final selectImagePath = ref.watch(selectIconImagePathProvider);

    return GridView.builder(
      itemCount: list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
      ),
      itemBuilder: (_, index) {
        final isSelected = list[index] == selectImagePath;

        return GestureDetector(
          onTap: () {
            ref.watch(selectIconImagePathProvider.notifier).state = list[index];
          },
          child: Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? colors.appColor : Colors.grey.shade400,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                isSelected ? colors.appColor : Colors.black,
                BlendMode.srcIn,
              ),
              child: Image.asset(list[index]),
            ),
          ),
        );
      },
    );
  }
}
