import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'bloc6_app_localizations_ca.dart';
import 'bloc6_app_localizations_en.dart';
import 'bloc6_app_localizations_es.dart';
import 'bloc6_app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of Bloc6AppLocalizations
/// returned by `Bloc6AppLocalizations.of(context)`.
///
/// Applications need to include `Bloc6AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/bloc6_app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: Bloc6AppLocalizations.localizationsDelegates,
///   supportedLocales: Bloc6AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the Bloc6AppLocalizations.supportedLocales
/// property.
abstract class Bloc6AppLocalizations {
  Bloc6AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static Bloc6AppLocalizations? of(BuildContext context) {
    return Localizations.of<Bloc6AppLocalizations>(
      context,
      Bloc6AppLocalizations,
    );
  }

  static const LocalizationsDelegate<Bloc6AppLocalizations> delegate =
      _Bloc6AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ca'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
  ];

  /// No description provided for @appBarTitle.
  ///
  /// In ca, this message translates to:
  /// **'Traduccions · Flutter natiu'**
  String get appBarTitle;

  /// No description provided for @welcome.
  ///
  /// In ca, this message translates to:
  /// **'Benvingut/da al curs de Flutter!'**
  String get welcome;

  /// No description provided for @greeting.
  ///
  /// In ca, this message translates to:
  /// **'Hola, {name}!'**
  String greeting(String name);

  /// No description provided for @itemsCount.
  ///
  /// In ca, this message translates to:
  /// **'{count, plural, zero{No hi ha elements} one{Hi ha 1 element} other{Hi ha {count} elements}}'**
  String itemsCount(int count);
}

class _Bloc6AppLocalizationsDelegate
    extends LocalizationsDelegate<Bloc6AppLocalizations> {
  const _Bloc6AppLocalizationsDelegate();

  @override
  Future<Bloc6AppLocalizations> load(Locale locale) {
    return SynchronousFuture<Bloc6AppLocalizations>(
      lookupBloc6AppLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ca', 'en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_Bloc6AppLocalizationsDelegate old) => false;
}

Bloc6AppLocalizations lookupBloc6AppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ca':
      return Bloc6AppLocalizationsCa();
    case 'en':
      return Bloc6AppLocalizationsEn();
    case 'es':
      return Bloc6AppLocalizationsEs();
    case 'fr':
      return Bloc6AppLocalizationsFr();
  }

  throw FlutterError(
    'Bloc6AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
