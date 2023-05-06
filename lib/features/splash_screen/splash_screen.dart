import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurantapp/core/util/app_colors/app_colors.dart';
import 'package:restaurantapp/core/util/app_images/app_images.dart';

import '../../core/util/app_icons/app_icons.dart';
import '../on_boarding_screen/on_boarding_scren.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  AnimationController? animationController;
  Animation<double>? feedingAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom
    ]);
    animationController=AnimationController(vsync:this,
        duration: const Duration(milliseconds: 600) );
    feedingAnimation =Tween<double>(begin: 0.2,end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);

    goToNextView();
  }

  @override
  void dispose() {
    animationController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Image(
          image: AssetImage(AppIcons.pizzaIcon),
          fit: BoxFit.cover,
        ),
        splashIconSize: 150,
        nextScreen: const OnBoardingScreen(),
        splashTransition: SplashTransition.rotationTransition,
        // pageTransitionType: PageTransitionType.downToUp,
        backgroundColor: AppColors.redMainColor);
  }
  void goToNextView() {

    Future.delayed(const Duration(seconds: 3),()
    {
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (BuildContext context) =>const OnBoardingScreen()
      //     )
      // );
    });
  }

}
enum PageTransitionType {
  fade,
  rightToLeft,
  leftToRight,
  upToDown,
  downToUp,
  scale,
  rotate,
  size,
  rightToLeftWithFade,
  leftToRightWithFade,
}

