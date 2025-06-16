import 'dart:async';

import 'package:emenu/app_coordinator.dart';
import 'package:emenu/core/component/build_cart_layout.dart';
import 'package:emenu/core/component/build_product_card_item.dart';
import 'package:emenu/core/component/build_scaffold_footer.dart';
import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/core/extensions/num_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/mvvm/data/model/category_model.dart';
import 'package:emenu/mvvm/data/model/category_product_model.dart';
import 'package:emenu/mvvm/data/model/product_model.dart';
import 'package:emenu/mvvm/view/list_product/dummy/dummy_product_list.dart';
import 'package:emenu/mvvm/view/list_product/widget/e_vertical_tabbar.dart';
import 'package:emenu/mvvm/viewmodel/cart/cart_provider.dart';
import 'package:emenu/mvvm/viewmodel/home/data_class/app_information.dart';
import 'package:emenu/mvvm/viewmodel/list_product/list_product_provider.dart';
import 'package:emenu/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListProductScreen extends StatefulWidget {
  const ListProductScreen({
    super.key,
    this.category,
  });

  final CategoryModel? category;

  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  final TextEditingController _searchController = TextEditingController();
  ListProductProvider get _provider => context.read<ListProductProvider>();

  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 100),
      () {
        _provider.getProductBySearch(query);
      },
    );
  }

  @override
  void initState() {
    _provider.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ListProductProvider>().state;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.isError) {
        context.showTopSnackbar(state.message ?? '', isError: true);
      }
    });
    return Scaffold(
      body: BuildCartLayout(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 5,
            right: 5,
          ),
          child: Consumer<ListProductProvider>(
              builder: (context, provider, child) {
            return Column(
              children: [
                _buildHeader(context),
                const SizedBox(height: 12),
                provider.searchText.isNotEmpty
                    ? _buildListSearchProduct(context, provider: provider)
                    : _buildListProduct(context, provider),
                const SizedBox(height: 12),
                _buildBottom(context, provider),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            final appInfo = AppInformation();
            String routeParam = appInfo.hashParam ??
                '${appInfo.tenantId}/${appInfo.orgId}/${appInfo.tableId}/${appInfo.floorId}/${appInfo.posTerminalId}/${appInfo.tableNo}/${appInfo.floorNo}/${appInfo.priceListId}';
            context.go('${AppPages.home}/$routeParam');
          },
          child: SvgPicture.asset(
            ImageConst.shopIcon,
            // width: 24,
            // height: 24,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 40,
            child: TextField(
              style: context.titleSmall,
              controller: _searchController,
              onChanged: _onSearchChanged,
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
                suffixIcon: InkWell(
                  onTap: () {
                    _searchController.clear();
                    _provider.getProductBySearch('');
                  },
                  child: const Icon(
                    Icons.close,
                    color: Color(0xFFA0A5BA),
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildListProduct(BuildContext context, ListProductProvider provider) {
    return Expanded(
      child: provider.state.isLoadingGetCategory ||
              provider.state.isLoadingGetProductByCategory
          ? Skeletonizer(
              child: EVerticalTabbar(
                tabs: dummyCateList,
                children: [
                  ...dummyCateProductList.map(
                    (item) =>
                        _buildProductCateItem(context, item, isLoading: true),
                  )
                ],
              ),
            )
          : EVerticalTabbar(
              tabs:
                  provider.listCategoryProduct.map((e) => e.category).toList(),
              initialIndex: widget.category != null
                  ? provider.listCategoryProduct.indexWhere(
                      (e) => e.category.id == widget.category!.id,
                    )
                  : 0,
              children: [
                ...provider.listCategoryProduct.map(
                  (item) => _buildProductCateItem(context, item),
                )
              ],
            ),
    );
  }

  Widget _buildProductCateItem(BuildContext context, CategoryProductModel item,
      {bool isLoading = false}) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Row(children: [
          Expanded(
            child: Text(
              item.category.name ?? '',
              style: context.titleLarge.copyWith(
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ]),
        const SizedBox(height: 50),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 60,
          ),
          itemCount: item.products.length,
          itemBuilder: (context, index) {
            return _buildProductCardItem(context, item.products[index],
                isLoading: isLoading);
          },
        ),
        if (item.loadingGetMoreProduct) ...[
          const SizedBox(height: 60),
          Skeletonizer(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 60,
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return _buildProductCardItem(
                    context, productSkeletonList[index],
                    isLoading: isLoading);
              },
            ),
          )
        ],
        const SizedBox(height: 14),
        if (!isLoading &&
            item.productPage < item.productTotalPage - 1 &&
            item.products.isNotEmpty &&
            !item.loadingGetMoreProduct)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _provider.getMoreProductByCategory(
                    item.category.id ?? 0,
                    item.productPage + 1,
                  );
                },
                child: Row(
                  children: [
                    Text(
                      S.of(context).viewMoreProduct,
                      style: context.titleMedium.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        ImageConst.arrowRightIcon,
                        width: 12,
                        height: 12,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
      ],
    );
  }

  Widget _buildProductCardItem(
    BuildContext context,
    ProductModel? item, {
    bool isLoading = false,
  }) {
    return GestureDetector(
      onTap: () {
        context.push(
          '${AppPages.listProduct}${AppPages.detailProduct}',
          extra: item,
        );
      },
      child: ProductCardItem(
        imageUrl: item?.imageUrl ?? ImageConst.foodImage,
        isBorder: true,
        imageTopPosition: -25,
        imageFit: BoxFit.cover,
        width: 180,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    item?.name ?? '',
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${S.of(context).description} : ${item?.description ?? ''}',
                  style: context.titleSmall.copyWith(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  item?.salesPrice?.toCurrencyFormat ?? '',
                  style: context.titleMedium.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                if (isLoading)
                  const SizedBox(
                    width: 24,
                    height: 24,
                    // child: CircularProgressIndicator(),
                  )
                else
                  SvgPicture.asset(
                    ImageConst.addIcon,
                    width: 24,
                    height: 24,
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListSearchProduct(
    BuildContext context, {
    required ListProductProvider provider,
  }) {
    final products = provider.listProductBySearch;
    final state = provider.state;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            state.isLoadingGetProductBySearch &&
                    provider.productBySearchCurrentPage == 0
                ? Skeletonizer(
                    child: _buildGridViewProduct(
                      context,
                      productSkeletonList,
                      isLoading: true,
                    ),
                  )
                : _buildGridViewProduct(
                    context,
                    products,
                  ),
            if (state.isLoadingGetProductBySearch &&
                provider.productBySearchCurrentPage > 0) ...[
              const SizedBox(height: 60),
              Skeletonizer(
                child: _buildGridViewProduct(
                  context,
                  productSkeletonList,
                  isLoading: true,
                ),
              )
            ],
            const SizedBox(height: 14),
            if (!state.isLoadingGetProductBySearch &&
                provider.productBySearchCurrentPage <
                    provider.productBySearchTotalPage - 1 &&
                products.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      provider.productBySearchCurrentPage++;
                      _provider.getProductBySearch(
                        _searchController.text,
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          S.of(context).viewMoreProduct,
                          style: context.titleMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SvgPicture.asset(
                          ImageConst.arrowRightIcon,
                          width: 12,
                          height: 12,
                        ),
                      ],
                    ),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }

  Widget _buildGridViewProduct(
    BuildContext context,
    List<ProductModel> products, {
    bool isLoading = false,
  }) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 60,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return _buildProductCardItem(context, products[index],
            isLoading: isLoading);
      },
    );
  }

  Widget _buildBottom(BuildContext context, ListProductProvider provider) {
    return Consumer<CartProvider>(builder: (context, cartProvider, child) {
      if (cartProvider.cartItems.isEmpty) {
        return const SizedBox();
      }
      return BuildScaffoldFooter(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        child: InkWell(
          onTap: () {
            GoRouter.of(context).push(
              AppPages.cart,
            );
          },
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                SvgPicture.asset(
                  ImageConst.shoppingBag,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  "${S.of(context).dishesOrder} (${cartProvider.cartItems.length})",
                  style: context.titleMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  "${cartProvider.getTotalCartPrice().toCurrencyFormat} đ",
                  style: context.titleMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
