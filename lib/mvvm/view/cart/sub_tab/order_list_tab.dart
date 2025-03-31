import 'package:emenu/core/component/build_custom_button.dart';
import 'package:emenu/core/component/build_scaffold_footer.dart';
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
    return Column(
      children: [
        Expanded(
          child: Padding(
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
                        text:
                            '${S.of(context).hi} Duyên, ${S.of(context).youAreSittingAt} ',
                        style: context.titleMedium,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Bàn 20',
                            style: context.titleMedium.copyWith(
                                color: Theme.of(context).primaryColor),
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
          ),
        ),
        _buildBottom(context),
      ],
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

  Widget _buildBottom(BuildContext context) {
    return BuildScaffoldFooter(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 12,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                S.of(context).dishList,
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          _buildItemFooter(),
          const SizedBox(
            height: 10,
          ),
          _buildItemFooter(),
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              Expanded(
                child: BuildCustomButton(
                  prefixIcon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).primaryColor,
                  ),
                  text: S.of(context).addDish,
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Theme.of(context).primaryColor,
                  borderColor: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: BuildCustomButton(
                  suffixIcon: const Icon(
                    Icons.arrow_forward_outlined,
                    color: Colors.white,
                  ),
                  text: S.of(context).requestOrder,
                  onPressed: () {},
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildItemFooter() {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Text(
          '1 x Lẩu gà lá é',
          style: context.titleSmall.copyWith(
            color: Theme.of(context).dividerColor,
          ),
        ),
        const Spacer(),
        Text(
          '100.000đ',
          style: context.titleSmall.copyWith(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ],
    );
  }
}
