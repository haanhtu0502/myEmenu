import 'package:emenu/mvvm/data/model/category_model.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter/material.dart';

class EVerticalTabbar extends StatefulWidget {
  const EVerticalTabbar({
    super.key,
    required this.children,
    required this.tabs,
    this.initialIndex = 0,
  });

  final List<Widget> children;
  final List<CategoryModel> tabs;
  final int initialIndex;

  @override
  State<EVerticalTabbar> createState() => _EVerticalTabbarState();
}

class _EVerticalTabbarState extends State<EVerticalTabbar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ItemScrollController _scrollController = ItemScrollController();
  final ItemPositionsListener _positionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener _offsetListener = ScrollOffsetListener.create();

  final ValueNotifier<bool> _isScrolling = ValueNotifier<bool>(false);
  bool _isInitialScrollDone = false;

  @override
  void initState() {
    _tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
    );

    _positionsListener.itemPositions.addListener(_handleScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        const Duration(milliseconds: 200),
        () => _scrollToInitialIndex(),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _positionsListener.itemPositions.removeListener(_handleScroll);

    super.dispose();
  }

  void _scrollToInitialIndex() {
    if (widget.initialIndex == 0) {
      _isInitialScrollDone = true;
      return;
    }
    if (_scrollController.isAttached && !_isInitialScrollDone) {
      _isScrolling.value = true;

      _scrollController.scrollTo(
        index: widget.initialIndex,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );

      _isScrolling.value = false;
      _isInitialScrollDone = true;
    }
  }

  void _onTabChange(int index) {
    _isScrolling.value = true;
    _scrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
    _isScrolling.value = false;
    // _tabController.animateTo(index);
  }

  void _handleScroll() {
    if (_isScrolling.value || !_isInitialScrollDone) return;
    _isScrolling.value = true;
    final positions = _positionsListener.itemPositions.value;
    final firstIndex =
        positions.isNotEmpty ? positions.first.index : widget.initialIndex;
    if (_tabController.index != firstIndex) {
      _tabController.animateTo(firstIndex);
    }
    _isScrolling.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          controller: _tabController,
          tabs: widget.tabs
              .map((e) => Tab(
                    height: 40,
                    child: Text(
                      e.name ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          indicatorColor: Theme.of(context).primaryColor,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          unselectedLabelColor: const Color.fromRGBO(162, 162, 162, 1.0),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 3,
          dividerColor: Colors.transparent,
          onTap: _onTabChange,
        ),
        const SizedBox(height: 12),
        Expanded(
            child: ScrollablePositionedList.builder(
          itemScrollController: _scrollController,
          itemPositionsListener: _positionsListener,
          scrollOffsetListener: _offsetListener,
          itemCount: widget.children.length,
          itemBuilder: (context, index) {
            return widget.children[index];
          },
        )),
      ],
    );
  }
}
