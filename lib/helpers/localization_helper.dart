import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;
  Map<String, Object> _phrases;

  AppLocalizations(this.locale);

  // Getter of Localization
  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  // Data Loader
  Future<bool> load() async {
    String data = await rootBundle
        .loadString('assets/lang/${this.locale.languageCode}.json');
    this._phrases = json.decode(data);
    return true;
  }

  // Localize Some Text
  String localize(String key) {
    return this._phrases[key];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = new AppLocalizations(locale);
    await localizations.load();
    print("Load ${locale.languageCode}");
    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
