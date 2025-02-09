import 'package:emenu/core/component/build_custom_button.dart';
import 'package:emenu/core/component/build_input_field.dart';
import 'package:emenu/core/component/build_popup_menu.dart';
import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/mvvm/viewmodel/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AppProvider get _appProvider => context.read<AppProvider>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF2D7FF9).withOpacity(0.3),
              const Color(0xFFFFFFFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageConst.dbizLogo,
                        width: 250,
                        height: 180,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  _buildTitle(context),
                  const SizedBox(height: 12),
                  _buildFormInput(context),
                  const SizedBox(height: 16),
                  _buildPopupMenuButton(context),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).poweredBy,
                  style: context.titleMedium.copyWith(
                    color: Theme.of(context).dividerColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(width: 5),
                Image.asset(
                  ImageConst.dbizLogo,
                  width: 35,
                  height: 35,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormInput(BuildContext context) {
    return Column(
      children: [
        BuilTextdInputField(
          label: S.of(context).name,
          hint: S.of(context).yourName,
          isRequired: true,
        ),
        const SizedBox(height: 10),
        BuilTextdInputField(
          label: S.of(context).phone,
          hint: S.of(context).yourPhone,
          isRequired: false,
        ),
        const SizedBox(height: 20),
        BuildCustomButton(
          text: S.of(context).startOrder,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      children: [
        Text(
          'Nhà hàng ẩm thực DBIZ',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          S.of(context).welcomeCustomer,
          style: context.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          S.of(context).pleaseProvideNamePhone,
          textAlign: TextAlign.center,
          style: context.titleMedium.copyWith(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ],
    );
  }

  Widget _buildPopupMenuButton(BuildContext context) {
    return Selector<AppProvider, String>(
        selector: (context, provider) => provider.languageCode,
        shouldRebuild: (previous, next) => previous != next,
        builder: (context, value, child) {
          return PopupMenuButtonCustom(
            width: 150,
            items: [
              MenuItem(
                icon: _buildImageAsset(
                    ImageConst.vietnamFlag, S.of(context).vietnamese),
                text: '',
                value: 'vi',
              ),
              MenuItem(
                icon:
                    _buildImageAsset(ImageConst.ukFlag, S.of(context).english),
                text: '',
                value: 'en',
              ),
            ],
            onSelected: (value) {
              _appProvider.setLanguage(value);
            },
            icon: _buildImageAsset(
              value == 'vi' ? ImageConst.vietnamFlag : ImageConst.ukFlag,
              value == 'vi' ? S.of(context).vietnamese : S.of(context).english,
              showIcon: true,
            ),
          );
        });
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
            height: 24,
            width: 24,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 4.0),
        Text(
          title,
          style: context.titleSmall.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
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
