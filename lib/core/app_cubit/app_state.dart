 import 'dart:ui';

import 'package:equatable/equatable.dart';

class AppState extends Equatable{
  final Locale locale;

  const AppState({
    required this.locale});

  factory AppState.initial()=>
      const AppState(locale:
      Locale('en'));

  AppState copyWith({
  Locale?locale
})=>AppState(
     locale: locale??this.locale
  );


  @override
  // TODO: implement props
  List<Object?> get props =>[
    locale
  ];


}


