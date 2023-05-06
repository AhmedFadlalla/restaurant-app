import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'app_event.dart';
import 'app_state.dart';



class AppBloc extends Bloc<AppEvent, AppState> {
  AppState get initialState=>AppState.initial();
  AppBloc(AppState appState) : super(appState) {

    on<ChangeAppLanguageEvent>((event, emit) {
      mapEventToState(event);
    });

  }

  Stream<AppState> mapEventToState(
      AppEvent event
      )async*{
    if(event is ChangeAppLanguageEvent ){
      yield AppState(locale: event.locale);
    }
  }

}
