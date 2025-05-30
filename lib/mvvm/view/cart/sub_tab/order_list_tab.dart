import 'package:emenu/app_coordinator.dart';
import 'package:emenu/core/component/build_custom_button.dart';
import 'package:emenu/core/component/build_scaffold_footer.dart';
import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/core/extensions/num_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/mvvm/data/model/product_cart_item/product_cart_item_model.dart';
import 'package:emenu/mvvm/view/cart/widget/build_order_list_item.dart';
import 'package:emenu/mvvm/viewmodel/app_provider.dart';
import 'package:emenu/mvvm/viewmodel/cart/cart_provider.dart';
import 'package:emenu/mvvm/viewmodel/home/data_class/app_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class OrderListTab extends StatefulWidget {
  const OrderListTab({super.key});

  @override
  State<OrderListTab> createState() => _OrderListTabState();
}

class _OrderListTabState extends State<OrderListTab> {
  AppProvider get _appProvider => context.read<AppProvider>();
  CartProvider get _cartProvider =>
      Provider.of<CartProvider>(context, listen: true);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, provider, child) {
      return Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        ImageConst.qrCodeIcon,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: RichText(
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
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset(
                        ImageConst.bagIcon,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  _buildListOrderItem(context, _cartProvider),
                ],
              ),
            ),
          ),
          _buildBottom(context, provider),
        ],
      );
    });
  }

  Widget _buildListOrderItem(BuildContext context, CartProvider provider) {
    return Expanded(
      child: ListView.builder(
        itemCount: provider.cartItems.length,
        itemBuilder: (context, index) {
          return Dismissible(
            confirmDismiss: (_) async {
              final result = await context.showConfirmDialog(
                title: S.of(context).removeItem,
                confirmText: S.of(context).removeItemConfirm,
                width: 400,
                onConfirm: () {
                  provider.removeFromCart(provider.cartItems[index]);
                  context.showTopSnackbar(
                    S.of(context).itemDeletedSuccessfully,
                  );
                },
              );

              return result;
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 16.0),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            key: Key("${provider.cartItems[index].product.productId}-$index"),
            onDismissed: (direction) {},
            child: BuildOrderListItem(
              isLastItem: index == provider.cartItems.length - 1,
              item: provider.cartItems[index],
            ),
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
                S.of(context).dishList,
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          ...provider.cartItems.map((e) => _buildItemFooter(e)).expand(
                (element) => [
                  const SizedBox(
                    height: 8,
                  ),
                  element,
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
                    Icons.arrow_back,
                    color: Theme.of(context).primaryColor,
                  ),
                  text: S.of(context).addDish,
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Theme.of(context).primaryColor,
                  borderColor: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: BuildCustomButton(
                  suffixIcon: const Icon(
                    Icons.arrow_forward_outlined,
                    color: Colors.white,
                  ),
                  text: S.of(context).requestOrder,
                  onPressed: () {},
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildItemFooter(ProductCartItemModel item) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Text(
          '${item.quantity} x ${item.product.name}',
          style: context.titleSmall.copyWith(
            color: Theme.of(context).dividerColor,
          ),
        ),
        const Spacer(),
        Text(
          '${item.totalPrice.toCurrencyFormat}đ',
          style: context.titleSmall.copyWith(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ],
    );
  }
}
