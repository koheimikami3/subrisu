import '../../constant/colors.dart' as colors;
import '../../importer.dart';

final list = [
  Assets.images.subscription.subrisu.path,
  Assets.images.subscription.netflix.path,
  Assets.images.subscription.primeVideo.path,
  Assets.images.subscription.disneyPlus.path,
  Assets.images.subscription.spotify.path,
  Assets.images.subscription.appleMusic.path,
  Assets.images.subscription.hulu.path,
  Assets.images.subscription.playStation.path,
  Assets.images.subscription.uberEats.path,
  Assets.images.subscription.foodDrink.path,
];

class IconList extends ConsumerWidget {
  const IconList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);
    final selectImagePath = ref.watch(selectIconImagePathProvider);
    final iconList = Assets.images.subscription.values;

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
