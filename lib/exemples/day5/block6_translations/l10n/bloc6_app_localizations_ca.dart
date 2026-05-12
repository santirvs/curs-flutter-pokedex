// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'bloc6_app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class Bloc6AppLocalizationsCa extends Bloc6AppLocalizations {
  Bloc6AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appBarTitle => 'Traduccions · Flutter natiu';

  @override
  String get welcome => 'Benvingut/da al curs de Flutter!';

  @override
  String greeting(String name) {
    return 'Hola, $name!';
  }

  @override
  String itemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hi ha $count elements',
      one: 'Hi ha 1 element',
      zero: 'No hi ha elements',
    );
    return '$_temp0';
  }
}
