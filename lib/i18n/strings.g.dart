/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 20 (10 per locale)
///
/// Built on 2023-12-03 at 14:28 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build),
	ur(languageCode: 'ur', build: _StringsUr.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	late final _StringsCommonEn common = _StringsCommonEn._(_root);
	late final _StringsMovieScreenEn movie_screen = _StringsMovieScreenEn._(_root);
	late final _StringsMovieDetailScreenEn movie_detail_screen = _StringsMovieDetailScreenEn._(_root);
}

// Path: common
class _StringsCommonEn {
	_StringsCommonEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get pleaseWait => 'Please Wait';
}

// Path: movie_screen
class _StringsMovieScreenEn {
	_StringsMovieScreenEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get watch => 'Watch';
	String get searchHint => 'TV shows, movies and more';
	String get topResults => 'Top Results';
}

// Path: movie_detail_screen
class _StringsMovieDetailScreenEn {
	_StringsMovieDetailScreenEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get watch => 'Watch';
	String get releaseDate => 'In Theaterers';
	String get getTickets => 'Get Tickets';
	String get watchTrailer => '  Watch Trailer';
	String get genres => 'Genres';
	String get overview => 'Overview';
}

// Path: <root>
class _StringsUr implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsUr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ur,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ur>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsUr _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsCommonUr common = _StringsCommonUr._(_root);
	@override late final _StringsMovieScreenUr movie_screen = _StringsMovieScreenUr._(_root);
	@override late final _StringsMovieDetailScreenUr movie_detail_screen = _StringsMovieDetailScreenUr._(_root);
}

// Path: common
class _StringsCommonUr implements _StringsCommonEn {
	_StringsCommonUr._(this._root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get pleaseWait => 'Please Wait';
}

// Path: movie_screen
class _StringsMovieScreenUr implements _StringsMovieScreenEn {
	_StringsMovieScreenUr._(this._root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get watch => 'Watch';
	@override String get searchHint => 'TV shows, movies and more';
	@override String get topResults => 'Top Results';
}

// Path: movie_detail_screen
class _StringsMovieDetailScreenUr implements _StringsMovieDetailScreenEn {
	_StringsMovieDetailScreenUr._(this._root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get watch => 'Watch';
	@override String get releaseDate => 'In Theaterers';
	@override String get getTickets => 'Get Tickets';
	@override String get watchTrailer => '  Watch Trailer';
	@override String get genres => 'Genres';
	@override String get overview => 'Overview';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.pleaseWait': return 'Please Wait';
			case 'movie_screen.watch': return 'Watch';
			case 'movie_screen.searchHint': return 'TV shows, movies and more';
			case 'movie_screen.topResults': return 'Top Results';
			case 'movie_detail_screen.watch': return 'Watch';
			case 'movie_detail_screen.releaseDate': return 'In Theaterers';
			case 'movie_detail_screen.getTickets': return 'Get Tickets';
			case 'movie_detail_screen.watchTrailer': return '  Watch Trailer';
			case 'movie_detail_screen.genres': return 'Genres';
			case 'movie_detail_screen.overview': return 'Overview';
			default: return null;
		}
	}
}

extension on _StringsUr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.pleaseWait': return 'Please Wait';
			case 'movie_screen.watch': return 'Watch';
			case 'movie_screen.searchHint': return 'TV shows, movies and more';
			case 'movie_screen.topResults': return 'Top Results';
			case 'movie_detail_screen.watch': return 'Watch';
			case 'movie_detail_screen.releaseDate': return 'In Theaterers';
			case 'movie_detail_screen.getTickets': return 'Get Tickets';
			case 'movie_detail_screen.watchTrailer': return '  Watch Trailer';
			case 'movie_detail_screen.genres': return 'Genres';
			case 'movie_detail_screen.overview': return 'Overview';
			default: return null;
		}
	}
}
