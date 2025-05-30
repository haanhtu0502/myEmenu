import 'package:emenu/core/component/custom_scroll_behavior.dart';
import 'package:emenu/core/configurations/configuration.dart';
import 'package:emenu/core/configurations/env/env_prod.dart';
import 'package:emenu/core/design_system/resource/constant.dart';
import 'package:emenu/core/di/di.dart';
import 'package:emenu/core/services/share_preferences_service.dart';
import 'package:emenu/mvvm/viewmodel/app_provider.dart';
import 'package:emenu/mvvm/viewmodel/cart/cart_provider.dart';
import 'package:emenu/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Configurations().setConfigurationValues(environmentProd);
  await configureDependencies(environment: Environment.prod);
  await SharedPreferencesService().init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: injector.get<AppProvider>(),
        ),
        ChangeNotifierProvider.value(
          value: injector.get<CartProvider>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return MaterialApp.router(
          title: Constant.appName,
          debugShowCheckedModeBanner: false,
          scrollBehavior: CustomScrollBehavior(),
          theme: provider.theme,
          key: provider.key,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: provider.currentLocale,
          routerConfig: appRouter,
        );
      },
    );
  }
}
