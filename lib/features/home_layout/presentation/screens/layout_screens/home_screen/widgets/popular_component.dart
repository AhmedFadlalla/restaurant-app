import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurantapp/core/util/app_images/app_images.dart';

import '../../../../../../../core/util/app_colors/app_colors.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            items: [AppImages.banner1,AppImages.banner2].map((e) {
          return Builder(builder: (BuildContext context)=>Image(image: AssetImage(e),
          fit: BoxFit.fitWidth,));
        }).toList(),
            options:  CarouselOptions(
          height: 150.h,
          aspectRatio: 16/9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 1500),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ))
      ],
    );
  }
}
