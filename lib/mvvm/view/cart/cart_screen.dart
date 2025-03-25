import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/mvvm/view/cart/sub_tab/order_list_tab.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          S.of(context).myCart,
          style: context.titleLarge,
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
                  return const SizedBox();
                default:
                  return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        controller: _tabController,
        isScrollable: true,
        tabs: [
          Tab(
            height: 40,
            child: Text(
              S.of(context).orderList,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Tab(
            height: 40,
            child: Text(
              S.of(context).orderHistory,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
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
        indicatorWeight: 3,
        dividerColor: Colors.transparent,
        onTap: (selectedIndex) {
          _selectedIndex.value = selectedIndex;
        },
      ),
    );
  }
}
