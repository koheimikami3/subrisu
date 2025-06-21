import '../../../../importer.dart';

class SubscriptionIconList extends ConsumerWidget {
  const SubscriptionIconList({super.key});

  static final List<AssetGenImage> iconList = [
    Assets.images.subscription.subrisu,
    Assets.images.subscription.foodDrink,
    Assets.images.subscription.restaurant,
    Assets.images.subscription.cafe,
    Assets.images.subscription.beer,
    Assets.images.subscription.home,
    Assets.images.subscription.electricity,
    Assets.images.subscription.water,
    Assets.images.subscription.gas,
    Assets.images.subscription.smartPhone,
    Assets.images.subscription.wifi,
    Assets.images.subscription.music,
    Assets.images.subscription.streaming,
    Assets.images.subscription.sns,
    Assets.images.subscription.game,
    Assets.images.subscription.book,
    Assets.images.subscription.camera,
    Assets.images.subscription.car,
    Assets.images.subscription.train,
    Assets.images.subscription.study,
    Assets.images.subscription.cloth,
    Assets.images.subscription.medicalCare,
    Assets.images.subscription.love,
    Assets.images.subscription.training,
    Assets.images.subscription.pc,
    Assets.images.subscription.pet,
    Assets.images.subscription.saving,
    Assets.images.subscription.account,
    Assets.images.subscription.netflix,
    Assets.images.subscription.primeVideo,
    Assets.images.subscription.disneyPlus,
    Assets.images.subscription.hulu,
    Assets.images.subscription.youTube,
    Assets.images.subscription.appleMusic,
    Assets.images.subscription.spotify,
    Assets.images.subscription.uberEats,
    Assets.images.subscription.twitter,
    Assets.images.subscription.google,
    Assets.images.subscription.amazon,
    Assets.images.subscription.nintendoSwitch,
    Assets.images.subscription.playStation,
    Assets.images.subscription.adobe,
    Assets.images.subscription.photoshop,
    Assets.images.subscription.premierePro,
    Assets.images.subscription.illustrator,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);
    final selectedIconImagePath =
        ref.watch(subscriptionFormNotifierProvider).selectedIconImagePath;

    return GridView.builder(
      itemCount: iconList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        mainAxisSpacing: 5.h,
        crossAxisSpacing: 5.w,
      ),
      itemBuilder: (_, index) {
        final isSelected = iconList[index].path == selectedIconImagePath;

        return GestureDetector(
          onTap: () {
            ref
                .read(subscriptionFormNotifierProvider.notifier)
                .setSelectedIconImagePath(iconList[index].path);
          },
          child: Container(
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? AppColors.primary : Colors.grey.shade400,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                isSelected
                    ? AppColors.primary
                    : selectColor(
                        context: context,
                        themeSettings: themeSettings,
                        lightColor: Colors.black,
                        darkColor: Colors.grey.shade100,
                      )!,
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
