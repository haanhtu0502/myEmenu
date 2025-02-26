import 'package:emenu/core/component/build_product_card_item.dart';
import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/mvvm/data/model/category_product_model.dart';
import 'package:emenu/mvvm/data/model/product_model.dart';
import 'package:emenu/mvvm/view/list_product/dummy/dummy_product_list.dart';
import 'package:emenu/mvvm/view/list_product/widget/e_vertical_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListProductScreen extends StatefulWidget {
  const ListProductScreen({super.key});

  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 12,
          right: 12,
        ),
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 12),
            _buildListProduct(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          ImageConst.shopIcon,
          // width: 24,
          // height: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 40,
            child: TextField(
              style: context.titleSmall,
              controller: _searchController,
              decoration: InputDecoration(
                hintText: S.of(context).search,
                hintStyle: context.titleSmall.copyWith(
                  color: Theme.of(context).hintColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color(0xFFF6F6F6),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 0,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFFA0A5BA),
                  size: 18,
                ),
                suffixIcon: const Icon(
                  Icons.close,
                  color: Color(0xFFA0A5BA),
                  size: 18,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildListProduct(BuildContext context) {
    return Expanded(
      child: EVerticalTabbar(
        tabs: dummyCateList,
        children: [
          ...dummyCateProductList.map((e) => _buildProductCateItem(context, e)),
        ],
      ),
    );
  }

  Widget _buildProductCateItem(
      BuildContext context, CategoryProductModel item) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Row(children: [
          Text(
            item.category.name ?? '',
            style: context.titleLarge.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
        const SizedBox(height: 50),
        GridView.builder(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.65,
            crossAxisSpacing: 12,
            mainAxisSpacing: 60,
          ),
          itemCount: item.products.length,
          itemBuilder: (context, index) {
            return _buildProductCardItem(context, item.products[index]);
          },
        ),
      ],
    );
  }

  Widget _buildProductCardItem(BuildContext context, ProductModel item) {
    return ProductCardItem(
      imageUrl: ImageConst.foodImage,
      isBorder: true,
      width: 170,
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                item.name ?? '',
                style: context.titleMedium.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          if (item.description != null) ...[
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  item.description ?? '',
                  style: context.titleMedium.copyWith(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                item.salesPrice?.toString() ?? '',
                style: context.titleMedium.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                ImageConst.addIcon,
                width: 24,
                height: 24,
              ),
            ],
          )
        ],
      ),
    );
  }
}
