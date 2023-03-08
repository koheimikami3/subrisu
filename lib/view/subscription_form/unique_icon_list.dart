import '../../constant/colors.dart' as colors;
import '../../importer.dart';

class UniqueIconList extends ConsumerWidget {
  const UniqueIconList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);
    final selectImagePath = ref.watch(selectIconImagePathProvider);
    // final iconList = Assets.images.subscription.values;
    final iconList = [
      Assets.images.subscription.subrisu,
      Assets.images.subscription.netflix,
      Assets.images.subscription.primeVideo,
      Assets.images.subscription.disneyPlus,
      Assets.images.subscription.spotify,
      Assets.images.subscription.appleMusic,
      Assets.images.subscription.hulu,
      Assets.images.subscription.playStation,
      Assets.images.subscription.uberEats,
    ];

    return GridView.builder(
      itemCount: iconList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        mainAxisSpacing: 5.h,
        crossAxisSpacing: 5.w,
      ),
      itemBuilder: (_, index) {
        final isSelected = iconList[index].path == selectImagePath;

        return GestureDetector(
          onTap: () {
            ref.read(selectIconImagePathProvider.notifier).state =
                iconList[index].path;
          },
          child: Container(
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? colors.appColor : Colors.grey.shade400,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                isSelected
                    ? colors.appColor
                    : isDark
                        ? Colors.grey.shade100
                        : Colors.black,
                BlendMode.srcIn,
              ),
              child: Image.asset(iconList[index].path),
            ),
          ),
        );
      },
    );
  }
}
