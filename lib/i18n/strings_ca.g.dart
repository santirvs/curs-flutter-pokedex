///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsCa = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ca,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ca>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// ca: 'Configuració'
	String get settingsTitle => 'Configuració';

	/// ca: 'Aparença'
	String get appearance => 'Aparença';

	/// ca: 'Clar'
	String get themeLight => 'Clar';

	/// ca: 'Fosc'
	String get themeDark => 'Fosc';

	/// ca: 'Idioma'
	String get language => 'Idioma';

	/// ca: 'Català'
	String get languageCatalan => 'Català';

	/// ca: 'Castellà'
	String get languageSpanish => 'Castellà';

	/// ca: 'Mapa'
	String get homeMap => 'Mapa';

	/// ca: 'Ranking'
	String get homeRanking => 'Ranking';

	/// ca: 'Admin'
	String get homeAdmin => 'Admin';

	/// ca: 'Configuració'
	String get settingsTooltip => 'Configuració';

	/// ca: 'Benvingut de nou'
	String get welcomeBackTitle => 'Benvingut de nou';

	/// ca: 'Ens alegra tornar-te a veure.'
	String get welcomeBackBody => 'Ens alegra tornar-te a veure.';

	/// ca: 'D'acord'
	String get ok => 'D\'acord';
}

/// The flat map containing all translations for locale <ca>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'settingsTitle' => 'Configuració',
			'appearance' => 'Aparença',
			'themeLight' => 'Clar',
			'themeDark' => 'Fosc',
			'language' => 'Idioma',
			'languageCatalan' => 'Català',
			'languageSpanish' => 'Castellà',
			'homeMap' => 'Mapa',
			'homeRanking' => 'Ranking',
			'homeAdmin' => 'Admin',
			'settingsTooltip' => 'Configuració',
			'welcomeBackTitle' => 'Benvingut de nou',
			'welcomeBackBody' => 'Ens alegra tornar-te a veure.',
			'ok' => 'D\'acord',
			_ => null,
		};
	}
}
