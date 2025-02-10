import 'package:emenu/mvvm/view/home/home_screen.dart';
import 'package:emenu/mvvm/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      builder: (context, state) => const Text('Splash Screen'),
    ),
    GoRoute(
      parentNavigatorKey: appNavigationKey,
      path: AppPages.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      parentNavigatorKey: appNavigationKey,
      path: AppPages.home,
      builder: (context, state) {
        // final tenantId = state.pathParameters['tenantId'];
        // final orgId = state.pathParameters['orgId'];
        // final tableId = state.pathParameters['tableId'];
        // final floorId = state.pathParameters['floorId'];
        // final posTerminalId = state.pathParameters['posTerminalId'];
        // final tableNo = state.pathParameters['tableNo'];
        // final floorNo = state.pathParameters['floorNo'];
        // final priceListId = state.pathParameters['priceListId'];
        return const HomeScreen();
      },
    ),
  ],
);
