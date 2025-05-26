import 'package:emenu/app_coordinator.dart';
import 'package:emenu/core/component/build_app_popup_menu_button.dart';
import 'package:emenu/core/component/build_cart_layout.dart';
import 'package:emenu/core/component/build_custom_button.dart';
import 'package:emenu/core/component/build_product_card_item.dart';
import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/mvvm/data/model/category_model.dart';
import 'package:emenu/mvvm/viewmodel/app_provider.dart';
import 'package:emenu/mvvm/viewmodel/home/data_class/app_information.dart';
import 'package:emenu/mvvm/viewmodel/home/home_provider.dart';
import 'package:emenu/routes/app_pages.dart';
import 'package:emenu/theme/theme_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider get _homeProvider => context.read<HomeProvider>();
  AppProvider get _appProvider => context.read<AppProvider>();
  final AppInformation _appInformation = AppInformation();

  @override
  void initState() {
    super.initState();
    _homeProvider.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeProvider>().state;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.isLoading) {}
      if (state.isError) {
        context.showTopSnackbar(state.message ?? '', isError: true);
      }
      if (state.isSuccess) {}
    });

    return BuildCartLayout(
      child: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(45, 127, 249, 0.2),
                  Color.fromRGBO(255, 255, 255, 0.2),
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildTitle(context),
                  const SizedBox(height: 12),
                  _buildBanner(context),
                  const SizedBox(height: 18),
                  _buildButtons(context),
                  const SizedBox(height: 18),
                  _buildCategories(context, provider),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              _appInformation.orgName ?? '',
              style: context.titleLarge.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const BuildAppPopupMenuButton(
              isShortLangName: true,
              width: 85,
              imgHeight: 16,
              imgWidth: 16,
              fontSize: 12,
            ),
          ],
        ),
        Row(children: [
          Icon(
            Icons.location_on,
            color: Theme.of(context).dividerColor,
          ),
          Text(
            ' ${_appInformation.address ?? ''}',
            style: context.titleSmall.copyWith(
              color: Theme.of(context).dividerColor,
            ),
          ),
        ])
      ],
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          ImageConst.foodBanner,
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 12),
        Text(
          '${S.of(context).goodMorning} ${_appProvider.customerName} !',
          style: context.titleMedium.copyWith(
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 6),
        Text.rich(
          TextSpan(
            text: '${S.of(context).youAreSitAt} ',
            style: context.titleSmall.copyWith(
              color: Theme.of(context).dividerColor,
            ),
            children: [
              TextSpan(
                text: _appInformation.tableNo ?? '',
                style: context.titleSmall.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: BuildCustomButton(
                text: S.of(context).callPayment,
                prefixIcon: const Icon(
                  Icons.wallet,
                  color: Colors.white,
                ),
                isVertical: true,
                radius: 20,
                color: ThemeConfig.greenColor,
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: BuildCustomButton(
                text: S.of(context).callEmployee,
                isVertical: true,
                prefixIcon: const Icon(
                  Icons.notification_important,
                  color: Colors.white,
                ),
                radius: 20,
                color: Theme.of(context).secondaryHeaderColor,
                onPressed: () {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: BuildCustomButton(
                text: S.of(context).orderFoodHear,
                isVertical: true,
                prefixIcon: const Icon(
                  Icons.restaurant_menu,
                  color: Colors.white,
                ),
                radius: 20,
                onPressed: () {
                  context.go(AppPages.listProduct);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategories(BuildContext context, HomeProvider provider) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Text(S.of(context).allCategory,
                    style: context.titleMedium)),
            // const Spacer(),
            ElevatedButton(
              onPressed: () {
                context.go(AppPages.listProduct);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: Row(
                children: [
                  Text(
                    S.of(context).viewAll,
                    style: context.titleMedium.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 52),
        provider.state.isLoadingGetCategroy
            ? Skeletonizer(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: Row(
                    children: [
                      ...List.generate(
                        3,
                        (index) => _buildCategoryItem(
                          context,
                          CategoryModel(
                            id: index,
                            name: '',
                            imageUrl: null,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                child: Row(
                  children: [
                    ..._homeProvider.categories.map(
                      (item) {
                        return _buildCategoryItem(context, item);
                      },
                    ).expand(
                      (element) => [
                        const SizedBox(width: 12),
                        element,
                      ],
                    ),
                  ],
                ),
              )
      ],
    );
  }

  Widget _buildCategoryItem(BuildContext context, CategoryModel item) {
    return ProductCardItem(
      imageUrl: item.imageUrl ?? ImageConst.defaultCategoryImg,
      width: 150,
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  item.name ?? '',
                  style: context.titleMedium.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                S.of(context).priceFrom,
                style: context.titleMedium.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                '49.000',
                style: context.titleMedium.copyWith(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
