import 'package:emenu/core/component/build_custom_button.dart';
import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/core/extensions/num_extension.dart';
import 'package:emenu/core/extensions/string_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/mvvm/data/model/request_history/request_history_model.dart';
import 'package:emenu/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BuildHistoryListItem extends StatefulWidget {
  const BuildHistoryListItem({
    super.key,
    required this.requestHistory,
  });

  final RequestHistoryModel requestHistory;

  @override
  State<BuildHistoryListItem> createState() => _BuildHistoryListItemState();
}

class _BuildHistoryListItemState extends State<BuildHistoryListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.requestHistory.valueStatus ?? '',
              style: context.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: widget
                    .requestHistory.status?.convertRequestOrderStatusToColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        const Divider(
          color: Color.fromRGBO(238, 242, 246, 1),
          height: 1,
        ),
        const SizedBox(
          height: 12,
        ),
        _buildHistoryInfo(context),
        const SizedBox(
          height: 10,
        ),
        _buildButtons(context),
      ],
    );
  }

  Widget _buildHistoryInfo(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            ImageConst.foodImage,
            width: double.infinity,
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      widget.requestHistory.product?.name ?? '',
                      style: context.titleMedium,
                    ),
                  ),
                  const SizedBox(width: 2),
                  Text(
                    ' x${widget.requestHistory.qty}',
                    style: context.titleMedium.copyWith(
                      color: const Color.fromRGBO(162, 170, 186, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              widget.requestHistory.lineDetails != null &&
                      widget.requestHistory.lineDetails!.isNotEmpty
                  ? Column(
                      children: [
                        ...widget.requestHistory.lineDetails!
                            .map(
                              (lineDetail) => Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    lineDetail.product?.name ?? '',
                                    style: context.titleMedium.copyWith(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                  if (lineDetail.qty != null &&
                                      lineDetail.qty! > 1)
                                    Text(
                                      ' x${lineDetail.qty}',
                                      style: context.titleMedium.copyWith(
                                        color: Theme.of(context).dividerColor,
                                      ),
                                    ),
                                ],
                              ),
                            )
                            .expand(
                              (element) => [
                                const SizedBox(height: 4),
                                element,
                              ],
                            ),
                      ],
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.book,
                    size: 18,
                    color: Theme.of(context).dividerColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.requestHistory.description ?? S.of(context).noNote,
                    style: context.titleMedium.copyWith(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text:
                            '${widget.requestHistory.salesPrice.toCurrencyFormat} ',
                        style: context.titleMedium.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                '| ${widget.requestHistory.created ?? ''} ⋅ Đã chờ ${widget.requestHistory.timeWaiting}p',
                            style: context.titleMedium.copyWith(
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtons(BuildContext context) {
    final status = widget.requestHistory.status;
    return Row(
      children: [
        Expanded(
          child: BuildCustomButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppPages.listProduct);
            },
            text: S.of(context).orderMore,
            color: Colors.white,
            borderColor: Theme.of(context).secondaryHeaderColor,
            textColor: Theme.of(context).secondaryHeaderColor,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: BuildCustomButton(
            onPressed: () {},
            text: S.of(context).priorityProcess,
            color: status == "PND"
                ? Theme.of(context).secondaryHeaderColor
                : Colors.white,
            textColor: status == 'PND'
                ? Colors.white
                : const Color.fromRGBO(
                    116,
                    131,
                    161,
                    1,
                  ),
            borderColor: status == 'PND'
                ? Colors.white
                : const Color.fromRGBO(
                    116,
                    131,
                    161,
                    1,
                  ),
          ),
        ),
      ],
    );
  }
}
