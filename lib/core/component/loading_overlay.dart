import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;

  const LoadingOverlay({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return const SizedBox();

    return Stack(
      children: [
        // Lớp mờ nền
        const Opacity(
          opacity: 0.6,
          child: ModalBarrier(dismissible: false, color: Colors.black),
        ),

        // Nội dung chính giữa
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(ImageConst.loadingImg,
                  width: 100, height: 100, animate: true),

              const SizedBox(height: 20),

              // Animation 3 chấm
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 25.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
