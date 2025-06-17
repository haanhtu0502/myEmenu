import 'package:emenu/app_coordinator.dart';
import 'package:emenu/core/component/build_cart_layout.dart';
import 'package:emenu/core/component/build_count_qty.dart';
import 'package:emenu/core/component/build_custom_button.dart';
import 'package:emenu/core/component/build_scaffold_footer.dart';
import 'package:emenu/core/component/image_render.dart';
import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/core/extensions/num_extension.dart';
import 'package:emenu/core/utils/logger.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/mvvm/data/model/product_cart_item/product_cart_item_model.dart';
import 'package:emenu/mvvm/data/model/product_component/product_component.dart';
import 'package:emenu/mvvm/data/model/product_model.dart';
import 'package:emenu/mvvm/view/product_detail/widget/build_list_row_item.dart';
import 'package:emenu/mvvm/viewmodel/cart/cart_provider.dart';
import 'package:emenu/mvvm/viewmodel/product_detail/product_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    super.key,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ProductDetailProvider get _provider =>
      Provider.of<ProductDetailProvider>(context, listen: false);
  CartProvider get _cartProvider =>
      Provider.of<CartProvider>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BuildCartLayout(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: _buildProductInformation(
                        context,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: _buildProductComponent(
                        context,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: _buildProductExtra(
                        context,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: TextField(
                        maxLines: 4,
                        onChanged: (value) {
                          _provider.note = value;
                        },
                        decoration: InputDecoration(
                          hintText: S.of(context).note,
                          hintStyle: TextStyle(
                            color: Theme.of(context).hintColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.grey[300]!,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.grey[300]!,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.grey[300]!,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProductInformation(BuildContext context) {
    return Selector<ProductDetailProvider, ProductModel>(
        selector: (p0, p1) => p1.product,
        builder: (context, product, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(32),
                      ),
                      child: ImageRender(
                        imageUrl: product.imageUrl ?? ImageConst.noImageImg,
                        width: double.infinity,
                        height: 230,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 14),
              Text(
                product.name ?? '',
                style: context.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                '${product.salesPrice?.toCurrencyFormat ?? ''} VND',
                style: context.titleMedium.copyWith(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                '${S.of(context).description}: ${product.description ?? ''}',
                style: context.titleSmall.copyWith(
                  color: Theme.of(context).hintColor,
                ),
              ),
            ],
          );
        });
  }

  Widget _buildProductComponent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).component,
          style: context.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Selector<ProductDetailProvider, ProductModel>(
          selector: (p0, p1) => p1.product,
          builder: (context, product, child) {
            return BuildListRowItem<ProductComponent>(
              items: product.components ?? [],
              emptyMessage: S.of(context).noComponentAvailable,
              itemBuilder: (item) => Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        item.name ?? '',
                        style: context.titleSmall,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      item.quantity?.toString() ?? '',
                      style: context.titleSmall,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      item.uomName ?? '',
                      style: context.titleSmall,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }

  Widget _buildProductExtra(BuildContext context) {
    return Selector<ProductDetailProvider, ProductModel>(
        selector: (p0, provider) => provider.product,
        builder: (context, value, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).extra,
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              BuildListRowItem<ProductComponent>(
                items: value.extraItems ?? [],
                emptyMessage: S.of(context).noExtraAvailable,
                itemBuilder: (item) => Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          item.name ?? '',
                          style: context.titleSmall
                              .copyWith(color: Theme.of(context).hintColor),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        item.salePrice?.toCurrencyFormat ?? '',
                        style: context.titleSmall,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BuildCountQty(
                            // width: 100,
                            value: 0,
                            onChanged: (value) {
                              _provider.changeQuantityProductExtra(
                                id: item.id,
                                value: value,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }

  Widget _buildFooter(BuildContext context) {
    return BuildScaffoldFooter(
      child: Consumer<ProductDetailProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      provider.product
                          .getTotalPrice(provider.quantity)
                          .toCurrencyFormat,
                      style: context.titleLargeS22.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  BuildCountQty(
                    value: provider.quantity,
                    minValue: 1,
                    onChanged: (value) {
                      provider.changeQuantity(value);
                    },
                  )
                ],
              ),
              const SizedBox(height: 12),
              BuildCustomButton(
                text: S.of(context).addToCart,
                textBold: false,
                radius: 12,
                onPressed: () {
                  final ProductCartItemModel productCardItem =
                      ProductCartItemModel(
                    product: provider.product.copyWith(),
                    quantity: provider.quantity,
                    note: provider.note,
                    totalPrice:
                        provider.product.getTotalPrice(provider.quantity),
                  );
                  _cartProvider.addToCart(
                    productCardItem,
                  );

                  context.showTopSnackbar(
                    S.of(context).addToCartSuccess,
                    isError: false,
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        S.of(context).detail,
        style: context.titleLarge.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: SvgPicture.asset(
          ImageConst.backIcon,
          width: 36,
          height: 36,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
