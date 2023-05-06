import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/util/app_images/app_images.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CarouselSlider(
                items: [AppImages.pizaaImage,AppImages.secondPizaaImage].map((e) {
                  return Builder(builder: (BuildContext context)=>
                     Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15.r),
                         image: DecorationImage(image: AssetImage(e),
                         fit: BoxFit.cover)
                       ),
                     ));
                }).toList(),
                options:  CarouselOptions(
                  height: 150.h,
                  aspectRatio: 16/9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 1500),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                )),

          ],
        ),
      ),
    );
  }
}
