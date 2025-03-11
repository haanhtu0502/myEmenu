import 'package:emenu/core/component/build_cart_layout.dart';
import 'package:emenu/core/component/build_count_qty.dart';
import 'package:emenu/core/component/build_custom_button.dart';
import 'package:emenu/core/component/build_scaffold_footer.dart';
import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/core/extensions/num_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/mvvm/view/product_detail/dummy/product_extra_dummy.dart';
import 'package:emenu/mvvm/view/product_detail/dummy/proudct_component_dummy.dart';
import 'package:emenu/mvvm/view/product_detail/widget/build_list_row_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
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
                        maxLines: 4, // Số dòng tối đa (null để không giới hạn)
                        decoration: InputDecoration(
                          hintText: 'Ghi chú',
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
                child: Image.asset(
                  ImageConst.foodImage,
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
          'Lẩu gà lá é Phú Yên',
          style: context.titleLarge.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          '100.000 VND',
          style: context.titleMedium.copyWith(
            color: Theme.of(context).secondaryHeaderColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Mô tả: Lẩu gà lá é Phú Yên',
          style: context.titleSmall.copyWith(
            color: Theme.of(context).hintColor,
          ),
        ),
      ],
    );
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
        BuildListRowItem(
          height: 100,
          items: listProductComponents,
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
                  item.qty ?? '',
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
        )
      ],
    );
  }

  Widget _buildProductExtra(BuildContext context) {
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
        BuildListRowItem(
          height: 200,
          items: listProductExtras,
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
                  item.price?.toCurrencyFormat ?? '',
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
                      value: item.qty ?? 0,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return BuildScaffoldFooter(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '49.000',
                  style: context.titleLargeS22
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              BuildCountQty(
                value: 1,
                onChanged: (value) {},
              )
            ],
          ),
          const SizedBox(height: 12),
          BuildCustomButton(
            text: S.of(context).addToCart,
            textBold: false,
            radius: 12,
            onPressed: () {},
          )
        ],
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
