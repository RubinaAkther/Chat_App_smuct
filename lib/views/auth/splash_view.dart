import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fade;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    fade = Tween(begin: 0.0, end: 1.0).animate(controller);
    scale = Tween(begin: 0.5, end: 1.0).animate(controller);

    controller.forward();

    _goNext();
  }

  void _goNext() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Opacity(
              opacity: fade.value,
              child: Transform.scale(
                scale: scale.value,
                child: const Text(
                  "SafeChat",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}