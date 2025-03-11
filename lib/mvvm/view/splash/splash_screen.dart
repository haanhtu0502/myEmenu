import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('SplashView'),
        centerTitle: true,
        leading: const SizedBox(),
      ),
      body: Center(
        child: Image.asset(
          ImageConst.dbizLogo,
          width: 200,
        ),
      ),
    );
  }
}
