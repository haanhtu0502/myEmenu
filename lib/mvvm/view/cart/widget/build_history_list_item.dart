import 'package:emenu/core/component/build_custom_button.dart';
import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/theme/theme_config.dart';
import 'package:flutter/material.dart';

class BuildHistoryListItem extends StatefulWidget {
  const BuildHistoryListItem({super.key});

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
              "Đã hoàn thành",
              style: context.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: ThemeConfig.greenColor,
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
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Pizza Hut ',
                      style: context.titleMedium,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'x1',
                          style: context.titleMedium.copyWith(
                            color: Theme.of(context).hintColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Sốt mè',
                    style: context.titleMedium.copyWith(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Sốt mè cay x2',
                    style: context.titleMedium.copyWith(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.book,
                    size: 18,
                    color: Theme.of(context).dividerColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Ít ngọt',
                    style: context.titleMedium.copyWith(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: '49.000  ',
                      style: context.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '|  30-12, 14:50 ⋅ Đã chờ 15p',
                          style: context.titleMedium.copyWith(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                      ],
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
    return Row(
      children: [
        Expanded(
          child: BuildCustomButton(
            onPressed: () {},
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
            color: Theme.of(context).secondaryHeaderColor,
            textColor: Colors.white,
            borderColor: Theme.of(context).secondaryHeaderColor,
          ),
        ),
      ],
    );
  }
}
