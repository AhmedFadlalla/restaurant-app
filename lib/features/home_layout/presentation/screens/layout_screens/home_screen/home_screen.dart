import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurantapp/core/util/app_images/app_images.dart';
import 'package:restaurantapp/features/home_layout/presentation/screens/layout_screens/home_screen/widgets/category_component/category_component.dart';
import 'package:restaurantapp/features/home_layout/presentation/screens/layout_screens/home_screen/widgets/popular_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.all(10.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Delivery to",
                      style: Theme.of(context).textTheme.headline2,),
                      SizedBox(height: 4.h,),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,color: Colors.grey,),
                          Text("Benha",
                          style: Theme.of(context).textTheme.caption,),
                        ],
                      )
                    ],
                  ),
                  CircleAvatar(
                    radius: 25.r,
                    backgroundImage: AssetImage(AppImages.personImage),
                  )

                ],
              ),
              PopularComponent(),
              SizedBox(height: 15.h,),
              CategoryComponent(),

            ],
          ),
        ),
      ),
    );
  }
}
