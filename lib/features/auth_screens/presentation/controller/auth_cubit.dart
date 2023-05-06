import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'auth_state.dart';



class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());


  static AuthCubit get(context)=>BlocProvider.of(context);


  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();


  bool radioValue=false;

  void radioToggle(){
    radioValue=!radioValue;
    emit(RadioToggleSuccess());
  }
}
