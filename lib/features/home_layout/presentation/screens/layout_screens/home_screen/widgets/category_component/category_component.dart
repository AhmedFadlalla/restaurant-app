import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurantapp/core/util/app_images/app_images.dart';
import 'package:restaurantapp/core/util/component/screens_component.dart';
import 'package:restaurantapp/core/util/widget/grid_view_second_component.dart';
import 'package:restaurantapp/features/home_layout/presentation/controller/home_layout_state.dart';

import '../../../../../../../../core/util/app_colors/app_colors.dart';
import '../../../../../../../../core/util/app_icons/app_icons.dart';
import '../../../../../../../product_details/presentation/screens/product_details/product_details_screen.dart';
import '../../../../../../domain/entities/product_data.dart';
import '../../../../../controller/home_layout_cubit.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    var cubit=HomeLayoutCubit.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Text("Categories",
              style: Theme.of(context).textTheme.headline6,)),
        SizedBox(
          height: 18.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (index) => InkWell(
            onTap: (){
              cubit.changeCategoryIndex(index);
            },
            child: Text(
              cubit.categories[index],
            style:TextStyle(
              fontSize: 14.sp,
              color:cubit.categoryIndex==index?AppColors.orangeColor: Colors.black
            ),),
          )),
        ),
        Padding(
          padding:  EdgeInsets.all(8.r),
          child: MainGridViewComponent(
              function: (index)=>buildCategoryProductItem(data: cubit.products[cubit.categoryIndex][index], context: context),
            length: cubit.products[cubit.categoryIndex].length,
            aspectRatio: 0.90,
          ),

        ),
      ],
    );
  },
);
  }
  Widget buildCategoryProductItem({
    required ProductData data,
    required context})=>InkWell(
    onTap: (){
      navigateTo(context, ProductDetailsScreen());
    },
      child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex:5,
            child: Container(

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        data.image,

                      ))
              ),
            ),
          ),
          SizedBox(height: 6.h,),
          Expanded(
              flex: 1,
              child: Text(data.name)),
          SizedBox(height: 6.h,),
          Expanded(
            flex: 1,
            child: Text(data.description,
              style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 10.sp
              ),),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$${data.price}",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      fontSize: 10.sp
                  ),),
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.star,color: Colors.yellow,
                        size: 15,),
                      Text("${data.rate}",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            fontSize: 10.sp
                        ),)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
  ),
    );
}
