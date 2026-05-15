// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'bloc6_app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class Bloc6AppLocalizationsEn extends Bloc6AppLocalizations {
  Bloc6AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appBarTitle => 'Translations · Vanilla Flutter';

  @override
  String get welcome => 'Welcome to the Flutter course!';

  @override
  String greeting(String name) {
    return 'Hello, $name!';
  }

  @override
  String itemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
      zero: 'No items',
    );
    return '$_temp0';
  }
}
