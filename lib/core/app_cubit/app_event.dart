import 'dart:ui';

import 'package:equatable/equatable.dart';


abstract class AppEvent extends Equatable{}
class ChangeAppLanguageEvent extends AppEvent{
 final Locale locale;


 ChangeAppLanguageEvent({
   required this.locale});

  @override
  List<Object?> get props => [locale];

}