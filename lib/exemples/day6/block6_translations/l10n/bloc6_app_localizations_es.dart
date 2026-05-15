// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'bloc6_app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class Bloc6AppLocalizationsEs extends Bloc6AppLocalizations {
  Bloc6AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appBarTitle => 'Traducciones · Flutter nativo';

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
