import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurantapp/core/util/app_colors/app_colors.dart';
import 'package:restaurantapp/features/auth_screens/presentation/controller/auth_state.dart';

import '../../../../../core/app_cubit/app_bloc.dart';
import '../../../../../core/app_cubit/app_event.dart';
import '../../../../../core/app_cubit/app_state.dart';
import '../../../../../core/localization/applocalization.dart';
import '../../../../../core/util/component/screens_component.dart';
import '../../controller/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<AppBloc, AppState>(

            builder: (context, state) {
              return TextButton(onPressed: () {
                AppBloc(AppState.initial())
                    .add(ChangeAppLanguageEvent(locale: AppLocalization.
                of(context)!.locale!.languageCode=='en'?Locale('ar'):Locale('en')));
              }, child: Text("A To E"));
            },
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
            builder: (context, state) {
              var cubit = AuthCubit.get(context);
              return Padding(
                padding: EdgeInsets.all(15.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalization.of(context)!.translate("sign_in"),
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline2,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    buildLoginFormFieldWithoutBorder(
                      labelText: "Email Address",
                      controller: cubit.emailController,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    buildLoginFormFieldWithoutBorder(
                        labelText: "Password",
                        controller: cubit.emailController),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Checkbox(
                                activeColor: Color(0xff00C8E8),
                                value: cubit.radioValue,
                                onChanged: (value) {
                                  cubit.radioToggle();
                                },
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text("Remember me")
                            ],
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forget Password?",
                              style: TextStyle(color: AppColors.greenMainColor),
                            ))
                      ],
                    ),
                    defaultButton(
                      context: context,
                      function: () {},
                      text: "Sign In",
                    )
                  ],
                ),
              );
            },
            listener: (context, state) {}),
      ),
    );
  }
}
