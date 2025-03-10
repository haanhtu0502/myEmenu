import 'package:emenu/core/component/build_app_popup_menu_button.dart';
import 'package:emenu/core/component/build_cart_layout.dart';
import 'package:emenu/core/component/build_custom_button.dart';
import 'package:emenu/core/component/build_product_card_item.dart';
import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/routes/app_pages.dart';
import 'package:emenu/theme/theme_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BuildCartLayout(
      child: Container(
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
              _buildCategories(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Nhà hàng ẩm thực Dbiz',
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
            ' 11D5 Khu Thảo Nguyên, Long Thạnh Mỹ, TP. Thủ Đức',
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
          '${S.of(context).goodMorning} Duyên !',
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
                text: 'Bàn 20',
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

  Widget _buildCategories(BuildContext context) {
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            children: [
              ...List.generate(
                7,
                (index) {
                  return _buildCategoryItem(context);
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

  Widget _buildCategoryItem(BuildContext context) {
    return ProductCardItem(
      imageUrl: ImageConst.foodCategory,
      width: 150,
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Món ăn ngon',
                style: context.titleMedium.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
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
