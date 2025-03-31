import 'package:emenu/core/component/build_custom_button.dart';
import 'package:emenu/core/component/build_scaffold_footer.dart';
import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/mvvm/view/cart/widget/build_history_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HistoryListTab extends StatefulWidget {
  const HistoryListTab({super.key});

  @override
  State<HistoryListTab> createState() => _HistoryListTabState();
}

class _HistoryListTabState extends State<HistoryListTab> {
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
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                _buildListOrderItem(context),
                const SizedBox(
                  height: 16,
                ),
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
      child: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          return const BuildHistoryListItem();
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
                S.of(context).paymentInfo,
                style: context.titleLarge.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                S.of(context).totalAmount,
                style: context.titleSmall.copyWith(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              const Spacer(),
              Text(
                '98.000 đ',
                style: context.titleSmall.copyWith(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                S.of(context).tax,
                style: context.titleSmall.copyWith(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              const Spacer(),
              Text(
                '10.000 đ',
                style: context.titleSmall.copyWith(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                S.of(context).total,
                style: context.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                '98.000 đ',
                style: context.titleLarge.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              Expanded(
                child: BuildCustomButton(
                  prefixIcon: Icon(
                    Icons.arrow_right_alt,
                    color: Theme.of(context).primaryColor,
                  ),
                  text: S.of(context).addDish,
                  onPressed: () {},
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  borderColor: Theme.of(context).primaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
