import 'package:emenu/core/component/build_custom_button.dart';
import 'package:emenu/core/component/image_render.dart';
import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SendRequestSuccessDialog extends StatelessWidget {
  const SendRequestSuccessDialog({
    super.key,
    this.imageUrl,
    this.title,
    this.isShowCloseButton = true,
    this.isShowCloseIcon = false,
  });

  final String? imageUrl;
  final String? title;
  final bool isShowCloseButton;
  final bool isShowCloseIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      width: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isShowCloseIcon)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close, size: 24),
                  onPressed: () => Navigator.of(context).pop(),
                  color: Theme.of(context).dividerColor,
                ),
              ],
            ),
          ImageRender(
            imageUrl: imageUrl ?? ImageConst.successImg,
            width: 80,
            height: 80,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title ?? S.of(context).sendRequestSuccess,
                  textAlign: TextAlign.center,
                  style: context.titleMedium,
                  softWrap: true,
                ),
              ),
            ],
          ),
          if (isShowCloseButton) ...[
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: BuildCustomButton(
                  width: double.infinity,
                  text: S.of(context).continueOrder,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  borderColor: Theme.of(context).primaryColor,
                )),
              ],
            ),
          ]
        ],
      ),
    );
  }
}
