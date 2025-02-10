import 'package:emenu/core/component/build_popup_menu.dart';
import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/mvvm/viewmodel/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildAppPopupMenuButton extends StatefulWidget {
  const BuildAppPopupMenuButton({
    super.key,
    this.isShortLangName = false,
    this.width,
    this.imgWidth,
    this.imgHeight,
    this.fontSize,
  });

  final bool isShortLangName;
  final double? width;
  final double? imgWidth;
  final double? imgHeight;
  final double? fontSize;

  @override
  State<BuildAppPopupMenuButton> createState() =>
      _BuildAppPopupMenuButtonState();
}

class _BuildAppPopupMenuButtonState extends State<BuildAppPopupMenuButton> {
  AppProvider get _appProvider => context.read<AppProvider>();

  @override
  Widget build(BuildContext context) {
    final String vietnamese =
        widget.isShortLangName ? 'VIE' : S.of(context).vietnamese;
    final String english =
        widget.isShortLangName ? 'EN' : S.of(context).english;
    return Selector<AppProvider, String>(
      selector: (context, provider) => provider.languageCode,
      shouldRebuild: (previous, next) => previous != next,
      builder: (context, value, child) {
        return PopupMenuButtonCustom(
          width: widget.width ?? 150,
          backgroundColor: Colors.white,
          items: [
            MenuItem(
              icon: _buildImageAsset(ImageConst.vietnamFlag, vietnamese),
              text: '',
              value: 'vi',
            ),
            MenuItem(
              icon: _buildImageAsset(ImageConst.ukFlag, english),
              text: '',
              value: 'en',
            ),
          ],
          onSelected: (value) {
            _appProvider.setLanguage(value);
          },
          icon: _buildImageAsset(
            value == 'vi' ? ImageConst.vietnamFlag : ImageConst.ukFlag,
            value == 'vi' ? vietnamese : english,
            showIcon: true,
          ),
        );
      },
    );
  }

  Widget _buildImageAsset(String assets, String title,
      {bool showIcon = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(32.0),
          child: Image.asset(
            assets,
            height: widget.imgHeight ?? 24,
            width: widget.imgWidth ?? 24,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 4.0),
        Text(
          title,
          style: context.titleSmall.copyWith(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: widget.fontSize ?? 14,
          ),
        ),
        if (showIcon) ...[
          const SizedBox(width: 4.0),
          Icon(
            Icons.arrow_drop_down,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ],
    );
  }
}
