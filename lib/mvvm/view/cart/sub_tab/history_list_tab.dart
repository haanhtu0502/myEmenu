import 'package:emenu/app_coordinator.dart';
import 'package:emenu/core/component/build_custom_button.dart';
import 'package:emenu/core/component/build_scaffold_footer.dart';
import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/core/extensions/num_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/mvvm/view/cart/widget/build_history_list_item.dart';
import 'package:emenu/mvvm/viewmodel/app_provider.dart';
import 'package:emenu/mvvm/viewmodel/cart/cart_provider.dart';
import 'package:emenu/mvvm/viewmodel/home/data_class/app_information.dart';
import 'package:emenu/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HistoryListTab extends StatefulWidget {
  const HistoryListTab({super.key});

  @override
  State<HistoryListTab> createState() => _HistoryListTabState();
}

class _HistoryListTabState extends State<HistoryListTab> {
  AppProvider get _appProvider => context.read<AppProvider>();
  CartProvider get _cartProvider =>
      Provider.of<CartProvider>(context, listen: false);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (_appProvider.customerPhone?.isEmpty ?? false) {
          context.showTopSnackbar(
            S.of(context).retailCustomerCannotViewHistory,
            isError: true,
          );
          return;
        }
      },
    );
    if (_appProvider.customerPhone?.isNotEmpty ?? false) {
      _cartProvider.getRequestHistory(_appProvider.customerPhone);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<CartProvider>(builder: (context, provider, child) {
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          ImageConst.qrCodeIcon,
                        ),
                        const SizedBox(width: 10),
                        RichText(
                          text: TextSpan(
                            text:
                                '${S.of(context).hi} ${_appProvider.customerName}, ${S.of(context).youAreSittingAt} ',
                            style: context.titleSmall,
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    '${S.of(context).table} ${AppInformation().tableNo}',
                                style: context.titleSmall.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    _buildListOrderItem(context, provider),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
            _buildBottom(context, provider),
          ],
        );
      }),
    );
  }

  Widget _buildListOrderItem(BuildContext context, CartProvider provider) {
    return Expanded(
      child: ListView.separated(
        itemCount: provider.listRequestHistory.length,
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          return BuildHistoryListItem(
            requestHistory: provider.listRequestHistory[index],
          );
        },
      ),
    );
  }

  Widget _buildBottom(BuildContext context, CartProvider provider) {
    return BuildScaffoldFooter(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 12,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                S.of(context).paymentInfo,
                style: context.titleLarge.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                S.of(context).totalAmount,
                style: context.titleSmall.copyWith(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              const Spacer(),
              Text(
                '${provider.getTotalHistoryPrice().toCurrencyFormat} đ',
                style: context.titleSmall.copyWith(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                S.of(context).tax,
                style: context.titleSmall.copyWith(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              const Spacer(),
              Text(
                '${provider.getTotalTaxAmount().toCurrencyFormat} đ',
                style: context.titleSmall.copyWith(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                S.of(context).total,
                style: context.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                '${(provider.getTotalHistoryPrice() + provider.getTotalTaxAmount()).toCurrencyFormat} đ',
                style: context.titleLarge.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              Expanded(
                child: BuildCustomButton(
                  prefixIcon: Icon(
                    Icons.arrow_right_alt,
                    color: Theme.of(context).primaryColor,
                  ),
                  text: S.of(context).addDish,
                  onPressed: () {
                    GoRouter.of(context).push(AppPages.listProduct);
                  },
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  borderColor: Theme.of(context).primaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
