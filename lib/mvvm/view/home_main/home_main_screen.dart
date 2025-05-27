import 'package:emenu/mvvm/view/home_main/home/home_screen.dart';
import 'package:emenu/mvvm/view/home_main/login/login_screen.dart';
import 'package:emenu/mvvm/viewmodel/app_provider.dart';
import 'package:emenu/mvvm/viewmodel/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:emenu/mvvm/view/splash/splash_screen.dart';
import 'package:provider/provider.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().initData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, value, child) {
        return Consumer<HomeProvider>(builder: (context, homeValue, child) {
          if (homeValue.state.isLoadingInitial) {
            return const SplashScreen();
          }
          return value.isLogin ? const HomeScreen() : const LoginScreen();
        });
      },
    );
  }
}
