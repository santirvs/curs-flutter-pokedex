// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'bloc6_app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class Bloc6AppLocalizationsFr extends Bloc6AppLocalizations {
  Bloc6AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appBarTitle => 'Traducciones · AA Flutter nativo';

  @override
  String get welcome => '¡Bienvenido/a al curso de Flutter!';

  @override
  String greeting(String name) {
    return '¡Hola, $name!';
  }

  @override
  String itemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hay $count elementos',
      one: 'Hay 1 elemento',
      zero: 'No hay elementos',
    );
    return '$_temp0';
  }
}
