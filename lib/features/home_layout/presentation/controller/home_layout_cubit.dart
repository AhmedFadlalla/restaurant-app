import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurantapp/core/util/app_images/app_images.dart';

import '../../domain/entities/product_data.dart';
import '../screens/layout_screens/cart_screen/cart_screen.dart';
import '../screens/layout_screens/home_screen/home_screen.dart';
import '../screens/layout_screens/profile_screen/profile_screen.dart';
import '../screens/layout_screens/search_screen/search_screen.dart';
import 'home_layout_state.dart';



class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());
  static HomeLayoutCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;

  List<Widget> screens=[
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen()
  ];
  List<BottomNavigationBarItem>  items=[
    BottomNavigationBarItem(icon: Icon(Icons.home)
        ,label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
    BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
    BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
  ];

  List<String> categories=[
    "All",
    "Popular",
    "Vegetarian",
    "Italian",
    "Chines"
  ];
  List<List<ProductData>> products=[
    [  const ProductData(
        name: "Pizza Ransh",
        image: AppImages.pizaaImage,
        description: "Pizza with Ransh Souse",
        price: 50,
        rate: 4.6),
      const ProductData(
          name: "Pizza Ransh",
          image: AppImages.pizaaImage,
          description: "Pizza with Ransh Souse",
          price: 50,
          rate: 4.6),
      const ProductData(
          name: "Pizza Ransh",
          image: AppImages.pizaaImage,
          description: "Pizza with Ransh Souse",
          price: 50,
          rate: 4.6),
      const ProductData(
          name: "Pizza Ransh",
          image: AppImages.pizaaImage,
          description: "Pizza with Ransh Souse",
          price: 50,
          rate: 4.6),
      const ProductData(
          name: "Pizza Ransh",
          image: AppImages.pizaaImage,
          description: "Pizza with Ransh Souse",
          price: 50,
          rate: 4.6),],
     [  const ProductData(
        name: "Pizza Mashroum",
        image: AppImages.pizaaImage,
        description: "Pizza with Mahroum ",
        price: 100,
        rate: 4.6),
      const ProductData(
          name: "Pizza Ransh",
          image: AppImages.pizaaImage,
          description: "Pizza with Ransh Souse",
          price: 50,
          rate: 4.6),
      const ProductData(
          name: "Pizza Ransh",
          image: AppImages.pizaaImage,
          description: "Pizza with Ransh Souse",
          price: 50,
          rate: 4.6),
      const ProductData(
          name: "Pizza Ransh",
          image: AppImages.pizaaImage,
          description: "Pizza with Ransh Souse",
          price: 50,
          rate: 4.6),
      const ProductData(
          name: "Pizza Ransh",
          image: AppImages.pizaaImage,
          description: "Pizza with Ransh Souse",
          price: 50,
          rate: 4.6),],
     [  const ProductData(
        name: "Om Ali",
        image: AppImages.pizaaImage,
        description: "Milk With brid",
        price: 30,
        rate:5),
      const ProductData(
          name: "Pizza Ransh",
          image: AppImages.pizaaImage,
          description: "Pizza with Ransh Souse",
          price: 50,
          rate: 4.6),
      const ProductData(
          name: "Pizza Ransh",
          image: AppImages.pizaaImage,
          description: "Pizza with Ransh Souse",
          price: 50,
          rate: 4.6),
      const ProductData(
          name: "Pizza Ransh",
          image: AppImages.pizaaImage,
          description: "Pizza with Ransh Souse",
          price: 50,
          rate: 4.6),
      const ProductData(
          name: "Pizza Ransh",
          image: AppImages.pizaaImage,
          description: "Pizza with Ransh Souse",
          price: 50,
          rate: 4.6),],
     [  const ProductData(
        name: "Pizza with vegetarian",
        image: AppImages.pizaaImage,
        description: "Pizza with vegetarian",
        price: 40,
        rate: 4.6),
      const ProductData(
          name: "Pizza Ransh",
          image: AppImages.pizaaImage,
          description: "Pizza with Ransh Souse",
          price: 50,
          rate: 4.6),
      const ProductData(
          name: "Pizza Ransh",
          image: AppImages.pizaaImage,
          description: "Pizza with Ransh Souse",
          price: 50,
          rate: 4.6),
      const ProductData(
          name: "Pizza Ransh",
          image: AppImages.pizaaImage,
          description: "Pizza with Ransh Souse",
          price: 50,
          rate: 4.6),
      const ProductData(
          name: "Pizza Ransh",
          image: AppImages.pizaaImage,
          description: "Pizza with Ransh Souse",
          price: 50,
          rate: 4.6),],
  [  const ProductData(
        name: "Pizza Chinees",
        image: AppImages.pizaaImage,
        description: "Pizza with Ransh Souse",
        price: 50,
        rate: 4.6),
      const ProductData(
          name: "Pizza Ransh",
          image: AppImages.pizaaImage,
          description: "Pizza with Ransh Souse",
          price: 50,
          rate: 4.6),
      const ProductData(
          name: "Pizza Ransh",
          image: AppImages.pizaaImage,
          description: "Pizza with Ransh Souse",
          price: 50,
          rate: 4.6),
      const ProductData(
          name: "Pizza Ransh",
          image: AppImages.pizaaImage,
          description: "Pizza with Ransh Souse",
          price: 50,
          rate: 4.6),
      const ProductData(
          name: "Pizza Ransh",
          image: AppImages.pizaaImage,
          description: "Pizza with Ransh Souse",
          price: 50,
          rate: 4.6),],

];

  int categoryIndex=0;




void changeCategoryIndex(int index){
  categoryIndex=index;
  emit(ChangeCategoryIndexSuccessState());
}
  void changeBottomNavBarIndex(int index){
    currentIndex=index;
    emit(ChangeBottomNavigationBarState());
  }
}
