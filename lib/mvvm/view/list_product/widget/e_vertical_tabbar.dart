import 'package:emenu/mvvm/data/model/category_model.dart';
import 'package:flutter/material.dart';

class EVerticalTabbar extends StatefulWidget {
  const EVerticalTabbar({
    super.key,
    required this.children,
    required this.tabs,
  });

  final List<Widget> children;
  final List<CategoryModel> tabs;

  @override
  State<EVerticalTabbar> createState() => _EVerticalTabbarState();
}

class _EVerticalTabbarState extends State<EVerticalTabbar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  final ValueNotifier<List<GlobalKey>> _keys =
      ValueNotifier<List<GlobalKey>>([]);

  final ValueNotifier<bool> _isScrolling = ValueNotifier<bool>(false);

  @override
  void initState() {
    _tabController = TabController(length: widget.tabs.length, vsync: this);

    _scrollController.addListener(_handleScroll);

    _keys.value = List.generate(widget.tabs.length, (index) => GlobalKey());
    super.initState();
  }

  void _onTabChange(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_keys.value[index].currentContext == null) return;
      final RenderBox renderBox =
          _keys.value[index].currentContext!.findRenderObject() as RenderBox;

      final position = renderBox.localToGlobal(Offset.zero);

      _scrollController.animateTo(
        position.dy,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
      _tabController.animateTo(index);
    });
  }

  void _handleScroll() {
    if (_isScrolling.value) return;
    _isScrolling.value = true;
    final offSet = _scrollController.offset;
    for (int i = 0; i < widget.tabs.length; i++) {
      final position = _getPosition(i);
      if (offSet >= position && offSet < position + 10) {
        _tabController.animateTo(i);
        break;
      }
    }
    _isScrolling.value = false;
  }

  double _getPosition(int index) {
    if (_keys.value[index].currentContext == null) return 0;
    final RenderBox renderBox =
        _keys.value[index].currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    return position.dy;
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
          // indicatorPadding: const EdgeInsets.symmetric(
          //   horizontal: 16,
          // ),
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
            child: ValueListenableBuilder(
          valueListenable: _keys,
          builder: (context, value, child) {
            if (_keys.value.isEmpty) return const SizedBox();
            return ListView.builder(
              controller: _scrollController,
              itemCount: widget.children.length,
              itemBuilder: (context, index) {
                return Container(
                  key: _keys.value[index],
                  child: widget.children[index],
                );
              },
            );
          },
        )),
      ],
    );
  }
}
