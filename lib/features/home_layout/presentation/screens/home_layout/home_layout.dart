import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurantapp/features/home_layout/presentation/controller/home_layout_cubit.dart';

import '../../../../../core/localization/applocalization.dart';
import '../../controller/home_layout_state.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit=HomeLayoutCubit.get(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home)
                  ,label: AppLocalization
                      .of(context)!
                      .translate("bottom_Home_label")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: AppLocalization.of(context)!.translate("bottom_Cart_label")),
              BottomNavigationBarItem(icon: Icon(Icons.search),
                  label: AppLocalization.of(context)!
                      .translate("bottom_Search_label")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: AppLocalization.of(context)
                  !.translate("bottom_Profile_label")),
            ],
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNavBarIndex(index);
            },

          ),
        );
      },
    );
  }
}
