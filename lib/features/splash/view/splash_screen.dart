import 'package:event_keeper/features/splash/controller/splash_controller.dart';
import 'package:event_keeper/shared/service_locator/app_dependencies.dart';
import 'package:event_keeper/shared/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = getIt<SplashController>();

  @override
  void initState() {
    controller.checkLogged(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.purple,
      body: Center(
        child: SvgPicture.asset('assets/splash.svg'),
      ),
    );
  }
}
