import 'package:emenu/core/component/build_app_popup_menu_button.dart';
import 'package:emenu/core/component/build_custom_button.dart';
import 'package:emenu/core/component/build_input_field.dart';
import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:emenu/mvvm/viewmodel/app_provider.dart';
import 'package:emenu/mvvm/viewmodel/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AppProvider get _appProvider => context.read<AppProvider>();
  LoginProvider get _loginProvider => context.read<LoginProvider>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(45, 127, 249, 0.2),
              Color.fromRGBO(255, 255, 255, 0.2),
            ],
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
                  const BuildAppPopupMenuButton(),
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BuilTextdInputField(
            label: S.of(context).name,
            hint: S.of(context).yourName,
            controller: _nameController,
            isRequired: true,
          ),
          const SizedBox(height: 10),
          BuilTextdInputField(
            label: S.of(context).phone,
            hint: S.of(context).yourPhone,
            controller: _phoneController,
            isRequired: true,
          ),
          const SizedBox(height: 20),
          BuildCustomButton(
            text: S.of(context).startOrder,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _loginProvider.setCustomerName(_nameController.text);
                _loginProvider.setCustomerPhone(_phoneController.text);
              }
            },
          ),
        ],
      ),
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
}
