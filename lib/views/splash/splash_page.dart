import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gsm_inside_flutter/views/home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 400,
      ));

  late CurvedAnimation curvedAnimation = CurvedAnimation(
    parent: animationController,
    curve: Curves.easeOutCirc,
  );

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
      const Duration(seconds: 1),
      () {
        animationController.forward();
      },
    );
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Homepage()),
          (bool) => false,
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: curvedAnimation,
      builder: (context, child) {
        return Scaffold(
          body: Center(
            child: Transform.translate(
              offset: Offset(curvedAnimation.value * 80 - 80, 0),
              child: Opacity(
                opacity: animationController.value,
                child: SvgPicture.asset(
                  '/Users/park-yuhyeon/Desktop/signet_flutter/assets/images/logo_main.svg',
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
