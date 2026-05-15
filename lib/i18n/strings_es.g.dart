///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEs extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override String get settingsTitle => 'Configuración';
	@override String get appearance => 'Apariencia';
	@override String get themeLight => 'Claro';
	@override String get themeDark => 'Oscuro';
	@override String get language => 'Idioma';
	@override String get languageCatalan => 'Catalán';
	@override String get languageSpanish => 'Castellano';
	@override String get homeMap => 'Mapa';
	@override String get homeRanking => 'Ranking';
	@override String get homeAdmin => 'Admin';
	@override String get settingsTooltip => 'Configuración';
	@override String get welcomeBackTitle => 'Bienvenido de nuevo';
	@override String get welcomeBackBody => 'Nos alegra volver a verte.';
	@override String get ok => 'De acuerdo';
}

/// The flat map containing all translations for locale <es>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'settingsTitle' => 'Configuración',
			'appearance' => 'Apariencia',
			'themeLight' => 'Claro',
			'themeDark' => 'Oscuro',
			'language' => 'Idioma',
			'languageCatalan' => 'Catalán',
			'languageSpanish' => 'Castellano',
			'homeMap' => 'Mapa',
			'homeRanking' => 'Ranking',
			'homeAdmin' => 'Admin',
			'settingsTooltip' => 'Configuración',
			'welcomeBackTitle' => 'Bienvenido de nuevo',
			'welcomeBackBody' => 'Nos alegra volver a verte.',
			'ok' => 'De acuerdo',
			_ => null,
		};
	}
}
