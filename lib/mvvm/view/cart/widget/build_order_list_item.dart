import 'package:emenu/core/component/build_count_qty.dart';
import 'package:emenu/core/component/image_render.dart';
import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/core/extensions/num_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/mvvm/data/model/product_cart_item/product_cart_item_model.dart';
import 'package:emenu/mvvm/view/cart/cart_coordinator.dart';
import 'package:emenu/mvvm/viewmodel/cart/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildOrderListItem extends StatefulWidget {
  const BuildOrderListItem({
    super.key,
    this.isLastItem = false,
    required this.item,
  });

  final bool isLastItem;
  final ProductCartItemModel item;

  @override
  State<BuildOrderListItem> createState() => _BuildOrderListItemState();
}

class _BuildOrderListItemState extends State<BuildOrderListItem> {
  CartProvider get _cartProvider =>
      Provider.of<CartProvider>(context, listen: false);
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
                ImageRender(
                  imageUrl:
                      widget.item.product.imageUrl ?? ImageConst.noImageImg,
                  height: 60,
                  width: double.infinity,
                  fit: BoxFit.contain,
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
                  value: widget.item.quantity,
                  onChanged: (p0) {
                    _cartProvider.updateCartItemQuantity(
                      widget.item,
                      p0,
                    );
                  },
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
                widget.item.product.name ?? '',
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                softWrap: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        ...widget.item.product.extraItems!
            .map(
              (e) => e.quantity != null && e.quantity! > 0
                  ? Text(
                      '${e.quantity} x ${e.name}',
                      style: context.titleMedium.copyWith(
                        color: Theme.of(context).dividerColor,
                      ),
                    )
                  : const SizedBox(),
            )
            .expand(
              (element) => [
                element,
                const SizedBox(
                  height: 4,
                )
              ],
            ),
        InkWell(
          onTap: () async {
            final result = await context.showAddNoteDialog(
              note: widget.item.note.isNotEmpty ? widget.item.note : null,
            );

            if (result != null) {
              _cartProvider.updateCartItemNote(
                widget.item,
                result,
              );
            }
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
                widget.item.note.isNotEmpty
                    ? widget.item.note
                    : S.of(context).addNote,
                style: context.titleMedium.copyWith(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          widget.item.totalPrice.toCurrencyFormat,
          style: context.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
