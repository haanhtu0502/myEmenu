import 'package:emenu/core/di/di.dart';
import 'package:emenu/mvvm/view/cart/view/cart_screen.dart';
import 'package:emenu/mvvm/view/home_main/home_main_screen.dart';
import 'package:emenu/mvvm/view/list_product/list_product_screen.dart';
import 'package:emenu/mvvm/view/home_main/login/login_screen.dart';
import 'package:emenu/mvvm/view/product_detail/product_detail_screen.dart';
import 'package:emenu/mvvm/view/splash/splash_screen.dart';
import 'package:emenu/mvvm/viewmodel/app_provider.dart';
import 'package:emenu/mvvm/viewmodel/home/data_class/app_information.dart';
import 'package:emenu/mvvm/viewmodel/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'app_pages.dart';

final appNavigationKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  initialLocation: AppPages.splash,
  navigatorKey: appNavigationKey,
  redirect: (context, state) {
    debugPrint('Current location: ${state.uri.path}');
    return null; // Ensure no unintended redirects happen
  },
  routes: [
    GoRoute(
      parentNavigatorKey: appNavigationKey,
      path: AppPages.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      parentNavigatorKey: appNavigationKey,
      path: AppPages.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      parentNavigatorKey: appNavigationKey,
      path: '${AppPages.home}/:hashParam',
      builder: (context, state) {
        final hashParam = state.pathParameters['hashParam'];
        return ChangeNotifierProvider(
          create: (context) => injector.get<HomeProvider>(
            param1: hashParam,
            param2: Provider.of<AppProvider>(context, listen: false),
          ),
          child: const HomeMainScreen(),
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: appNavigationKey,
      path:
          '${AppPages.home}/:tenantId/:orgId/:tableId/:floorId/:posTerminalId/:tableNo/:floorNo/:priceListId',
      builder: (context, state) {
        final tenantId = state.pathParameters['tenantId'];
        final orgId = state.pathParameters['orgId'];
        final tableId = state.pathParameters['tableId'];
        final floorId = state.pathParameters['floorId'];
        final posTerminalId = state.pathParameters['posTerminalId'];
        final tableNo = state.pathParameters['tableNo'];
        final floorNo = state.pathParameters['floorNo'];
        final priceListId = state.pathParameters['priceListId'];

        AppInformation().initData(
          orgId: int.tryParse(orgId ?? ''),
          tenantId: int.tryParse(tenantId ?? ''),
          tableId: int.tryParse(tableId ?? ''),
          floorId: int.tryParse(floorId ?? ''),
          posTerminalId: int.tryParse(posTerminalId ?? ''),
          tableNo: tableNo,
          floorNo: floorNo,
          priceListId: int.tryParse(priceListId ?? ''),
        );
        return ChangeNotifierProvider(
          create: (context) => injector.get<HomeProvider>(
            param2: Provider.of<AppProvider>(context, listen: false),
          ),
          child: const HomeMainScreen(),
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: appNavigationKey,
      path: AppPages.listProduct,
      builder: (context, state) => const ListProductScreen(),
      routes: [
        GoRoute(
          parentNavigatorKey: appNavigationKey,
          path: AppPages.detailProduct,
          builder: (context, state) => const ProductDetailScreen(),
        )
      ],
    ),
    GoRoute(
      parentNavigatorKey: appNavigationKey,
      path: AppPages.cart,
      builder: (context, state) => const CartScreen(),
    ),
  ],
);
