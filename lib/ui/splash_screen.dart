import 'package:chef_wizz/gen/assets.gen.dart';
import 'package:chef_wizz/ui/ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (!context.mounted) return;
      context.router.replace(const BaseRoute());
    });
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: AppAssets.images.cooking.image(
          width: double.infinity,
          height: 400,
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.srcIn,
        ),
      ),
    );
  }
}
