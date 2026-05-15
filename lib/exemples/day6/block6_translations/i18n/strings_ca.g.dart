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
class TranslationsCa extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsCa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ca,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ca>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsCa _root = this; // ignore: unused_field

	@override 
	TranslationsCa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsCa(meta: meta ?? this.$meta);

	// Translations
	@override String get appBarTitle => 'Traduccions · Slang';
	@override String get welcome => 'Benvingut/da al curs de Flutter!';
	@override String greeting({required Object name}) => 'Hola, ${name}!';
	@override String itemsCount({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ca'))(n,
		zero: 'No hi ha elements',
		one: 'Hi ha 1 element',
		other: 'Hi ha ${n} elements',
	);
}

/// The flat map containing all translations for locale <ca>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsCa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appBarTitle' => 'Traduccions · Slang',
			'welcome' => 'Benvingut/da al curs de Flutter!',
			'greeting' => ({required Object name}) => 'Hola, ${name}!',
			'itemsCount' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ca'))(n, zero: 'No hi ha elements', one: 'Hi ha 1 element', other: 'Hi ha ${n} elements', ), 
			_ => null,
		};
	}
}
