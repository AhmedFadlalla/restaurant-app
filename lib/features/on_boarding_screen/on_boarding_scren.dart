import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/util/app_colors/app_colors.dart';
import '../../../core/util/app_images/app_images.dart';
import '../../../core/util/screen_util_component/screen_util_component.dart';
import '../../core/util/component/screens_component.dart';
import '../auth_screens/presentation/screen/login/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController(keepPage: true);

  List<String> screens = [
    AppImages.onBoarding1Image,
    AppImages.onBoarding2Image,

  ];
  List<String> text = [
    "Ummy Pizza",
    "Fast Delivery",

  ];
  List<String> description = [
    "You can book your favourite hotel any time and any place",
    "Thousands of hotels and villas world wide",
    "Thousands of hotels and villas world wide",
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Expanded(
              child: PageView.builder(
                  allowImplicitScrolling: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  pageSnapping: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: screens.length,
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if(index==0)
                           Image(
                          width:250.w,
                            image: AssetImage(
                              screens[index],
                            ),
                            fit: BoxFit.cover),
                        if(index==1)
                          Padding(
                            padding:  EdgeInsets.only(top: 50.h),
                            child: Image(
                                width:250.w,
                                image: AssetImage(
                                  screens[index],
                                ),
                                fit: BoxFit.cover),
                          ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(text[index],style: Theme.of(context).textTheme.headline2,),
                        SizedBox(
                          height: 18.h,
                        ),
                        Text(
                          description[index],
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500
                              ).fontFamily
                          ),
                          textAlign: TextAlign.center,
                        ),



                      ],
                    );
                  }),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 2,
              effect: ScrollingDotsEffect(
                radius: 10.r,
                dotWidth: 12.w,
                dotHeight: 12.w,
                dotColor: Colors.black38,
                activeDotColor: AppColors.mainColor,
              ),

            ),
            SizedBox(
              height: 28,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25.r),
              child: defaultButton(
                  context: context,
                  function: (){
                navigateTo(context, LoginScreen());
              }, text: "Skip"),
            )
          ],
        ),
      ),
    );
  }
}