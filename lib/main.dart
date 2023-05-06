

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurantapp/core/app_cubit/app_bloc.dart';
import 'package:restaurantapp/core/app_cubit/app_state.dart';
import 'package:restaurantapp/core/helper/cach_helper/cach_helper.dart';
import 'package:restaurantapp/core/localization/applocalization.dart';
import 'package:restaurantapp/core/util/app_shared_pref/app_shared_pref.dart';
import 'package:restaurantapp/features/home_layout/presentation/screens/home_layout/home_layout.dart';

import 'core/util/app_theme/app_themes.dart';
import 'core/util/constant/constant.dart';
import 'features/home_layout/presentation/controller/home_layout_cubit.dart';
import 'features/splash_screen/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();

  isEnglish=CachHelper.getData(key: AppSharedPreference.isEnglish);

  runApp( MyApp(fromShared: isEnglish,));
}

class MyApp extends StatelessWidget {
  bool? fromShared;
   MyApp({super.key,
  this.fromShared});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),

        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context,widget)=>MultiBlocProvider(
            providers: [
              BlocProvider(create: (context)=>AppBloc(AppState.initial())),
              BlocProvider(create: (context)=>HomeLayoutCubit()),
            ],
            child: MaterialApp(
              supportedLocales: [
                Locale("en"),
                Locale("ar")
              ],
          localizationsDelegates: [
            AppLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          localeResolutionCallback: (deviceLocal,supportedLocal){
                for(var locale in supportedLocal){
                  if(deviceLocal !=null && deviceLocal.languageCode==locale.languageCode){
                    return deviceLocal;
                  }
                }
                return supportedLocal.first;
          },
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppThemes.lightTheme,
          home: HomeLayout(),
        )));
  }
}


