import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AppLocalization{
final Locale? locale;
AppLocalization({
  this.locale
});
static LocalizationsDelegate<AppLocalization> delegate=_AppLocalizationDelegate();
static AppLocalization? of(context)
=>Localizations.of<
    AppLocalization>(
    context,
    AppLocalization);

late Map<String,String> _localizedString;

Future loadJsonLanguage()async{
  String jsonString=await rootBundle.loadString("assets/lang/${locale!.languageCode}.json");
  Map<String,dynamic> jsonMap=json.decode(jsonString);
  _localizedString=jsonMap.map((key, value) =>MapEntry(key, value.toString()));


}
String translate(String key)=>_localizedString[key]??"";
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization>{
  @override
  bool isSupported(Locale locale) {
    return ['en','ar'].contains(locale.languageCode);

  }

  @override
  Future<AppLocalization> load(Locale locale)async {
    AppLocalization localization=AppLocalization(locale: locale);
    await localization.loadJsonLanguage();
    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) {
    return false;
  }

}