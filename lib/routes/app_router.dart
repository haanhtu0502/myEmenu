import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_pages.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppPages.splash,
  routes: [
    GoRoute(
      path: AppPages.splash,
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
      path: AppPages.login,
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
      path: AppPages.home,
      builder: (context, state) {
        final tenantId = state.pathParameters['tenantId'];
        final orgId = state.pathParameters['orgId'];
        final tableId = state.pathParameters['tableId'];
        final floorId = state.pathParameters['floorId'];
        final posTerminalId = state.pathParameters['posTerminalId'];
        final tableNo = state.pathParameters['tableNo'];
        final floorNo = state.pathParameters['floorNo'];
        final priceListId = state.pathParameters['priceListId'];
        return Placeholder();
      },
    ),
  ],
);
