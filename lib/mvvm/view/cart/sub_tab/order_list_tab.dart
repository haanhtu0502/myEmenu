import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/mvvm/view/cart/widget/build_order_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';

class OrderListTab extends StatefulWidget {
  const OrderListTab({super.key});

  @override
  State<OrderListTab> createState() => _OrderListTabState();
}

class _OrderListTabState extends State<OrderListTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                ImageConst.qrCodeIcon,
              ),
              const SizedBox(width: 10),
              RichText(
                text: TextSpan(
                  text: 'Chào Duyên, bạn đang ngồi tại ',
                  style: context.titleMedium,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Bàn 20',
                      style: context.titleMedium
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                ImageConst.bagIcon,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          _buildListOrderItem(context),
        ],
      ),
    );
  }

  Widget _buildListOrderItem(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return BuildOrderListItem(
            isLastItem: index == 3,
          );
        },
      ),
    );
  }
}
