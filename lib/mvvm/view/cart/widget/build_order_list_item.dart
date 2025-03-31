import 'package:emenu/core/component/build_count_qty.dart';
import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/mvvm/view/cart/cart_coordinator.dart';
import 'package:flutter/material.dart';

class BuildOrderListItem extends StatefulWidget {
  const BuildOrderListItem({
    super.key,
    this.isLastItem = false,
  });

  final bool isLastItem;

  @override
  State<BuildOrderListItem> createState() => _BuildOrderListItemState();
}

class _BuildOrderListItemState extends State<BuildOrderListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        // horizontal: 14,
      ),
      decoration: BoxDecoration(
        border: !widget.isLastItem
            ? Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.3),
                  width: 1,
                ),
              )
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  ImageConst.foodImage,
                  width: double.infinity,
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            flex: 3,
            child: _buildOrderInfo(context),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BuildCountQty(
                  value: 1,
                  onChanged: (p0) {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOrderInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Lẩu Gà Lá É Đặc Sản Phú Yên',
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                softWrap: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          '1 x 100.000đ',
          style: context.titleMedium.copyWith(
            color: Theme.of(context).dividerColor,
          ),
        ),
        const SizedBox(height: 4),
        InkWell(
          onTap: () async {
            await context.showAddNoteDialog();
          },
          child: Row(
            children: [
              Icon(
                Icons.book,
                size: 18,
                color: Theme.of(context).dividerColor,
              ),
              const SizedBox(width: 4),
              Text(
                S.of(context).addNote,
                style: context.titleMedium.copyWith(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '49.000',
          style: context.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
