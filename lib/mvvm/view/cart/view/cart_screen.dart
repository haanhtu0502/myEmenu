import 'package:emenu/app_coordinator.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/mvvm/view/cart/cart_coordinator.dart';
import 'package:emenu/mvvm/view/cart/sub_tab/history_list_tab.dart';
import 'package:emenu/mvvm/view/cart/sub_tab/order_list_tab.dart';
import 'package:emenu/core/component/loading_overlay.dart';
import 'package:emenu/mvvm/viewmodel/cart/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  TabController? _tabController;

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      animationDuration: const Duration(milliseconds: 200),
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CartProvider>().cartViewState;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (state.isSendRequestOrderFailed) {
          context.showTopSnackbar(
            state.message!,
            isError: true,
          );
        } else if (state.isSendRequestOrderSuccess) {
          context.showSendRequestSuccessDialog();
        } else if (state.isGetRequestHistoryFailed) {
          context.showTopSnackbar(
            state.message!,
            isError: true,
          );
        }
      },
    );
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                S.of(context).myCart,
                style: context.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0.0,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            body: Column(
              children: [
                _buildTabBar(context),
                const SizedBox(height: 10),
                ValueListenableBuilder(
                  valueListenable: _selectedIndex,
                  builder: (context, value, child) {
                    switch (value) {
                      case 0:
                        return const Expanded(
                          child: OrderListTab(),
                        );
                      case 1:
                        return const Expanded(
                          child: HistoryListTab(),
                        );
                      default:
                        return const SizedBox();
                    }
                  },
                )
              ],
            ),
          ),
          Consumer<CartProvider>(builder: (context, provider, child) {
            return LoadingOverlay(
              isLoading: provider.cartViewState.isLoadingSendRequestOrder,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      child: TabBar(
        controller: _tabController,
        isScrollable: false,
        tabs: [
          Tab(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).orderList,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Tab(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).orderHistory,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
        indicatorColor: Theme.of(context).primaryColor,
        labelColor: Theme.of(context).primaryColor,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        unselectedLabelColor: const Color.fromRGBO(162, 162, 162, 1.0),
        indicatorSize: TabBarIndicatorSize.tab,
        padding: const EdgeInsets.all(4.0),
        indicatorWeight: 3,
        dividerColor: Colors.transparent,
        onTap: (selectedIndex) {
          _selectedIndex.value = selectedIndex;
        },
      ),
    );
  }
}
