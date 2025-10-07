import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Pokedex'**
  String get homeTitle;

  /// No description provided for @regionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Regions'**
  String get regionsTitle;

  /// No description provided for @favoritesTitle.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favoritesTitle;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @comingSoonTitle.
  ///
  /// In en, this message translates to:
  /// **'Coming soon!'**
  String get comingSoonTitle;

  /// No description provided for @comingSoonDescription.
  ///
  /// In en, this message translates to:
  /// **'We are working to bring you this section. Come back later to discover all the news.'**
  String get comingSoonDescription;

  /// No description provided for @noFavoritesTitle.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t marked any Pokémon as favorite'**
  String get noFavoritesTitle;

  /// No description provided for @noFavoritesDescription.
  ///
  /// In en, this message translates to:
  /// **'Click the heart icon on your favorite Pokémon and they will appear here.'**
  String get noFavoritesDescription;

  /// No description provided for @homeSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search Pokémon...'**
  String get homeSearchHint;

  /// No description provided for @filterTitle.
  ///
  /// In en, this message translates to:
  /// **'Filter by your preferences'**
  String get filterTitle;

  /// No description provided for @filterTypes.
  ///
  /// In en, this message translates to:
  /// **'Types'**
  String get filterTypes;

  /// No description provided for @filterApply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get filterApply;

  /// No description provided for @filterCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get filterCancel;

  /// No description provided for @filterErrorTypes.
  ///
  /// In en, this message translates to:
  /// **'Error loading types: {error}'**
  String filterErrorTypes(Object error);

  /// No description provided for @filterFoundPrefix.
  ///
  /// In en, this message translates to:
  /// **'Found '**
  String get filterFoundPrefix;

  /// No description provided for @filterFoundResults.
  ///
  /// In en, this message translates to:
  /// **'{count} results'**
  String filterFoundResults(Object count);

  /// No description provided for @filterClear.
  ///
  /// In en, this message translates to:
  /// **'Clear filter'**
  String get filterClear;

  /// No description provided for @generalErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong...'**
  String get generalErrorTitle;

  /// No description provided for @generalErrorDescription.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t load the information at this time. Please check your connection or try again later.'**
  String get generalErrorDescription;

  /// No description provided for @generalErrorRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get generalErrorRetry;

  /// No description provided for @pokemonGeneralDescription.
  ///
  /// In en, this message translates to:
  /// **'Pokémon are mysterious creatures with unique abilities and characteristics. Each Pokémon has its own strengths, weaknesses, and evolutionary path. They inhabit diverse environments and form bonds with trainers around the world.'**
  String get pokemonGeneralDescription;

  /// No description provided for @weightLabel.
  ///
  /// In en, this message translates to:
  /// **'WEIGHT'**
  String get weightLabel;

  /// No description provided for @heightLabel.
  ///
  /// In en, this message translates to:
  /// **'HEIGHT'**
  String get heightLabel;

  /// No description provided for @categoryLabel.
  ///
  /// In en, this message translates to:
  /// **'CATEGORY'**
  String get categoryLabel;

  /// No description provided for @abilityLabel.
  ///
  /// In en, this message translates to:
  /// **'ABILITY'**
  String get abilityLabel;

  /// No description provided for @weaknessesLabel.
  ///
  /// In en, this message translates to:
  /// **'Weaknesses'**
  String get weaknessesLabel;

  /// No description provided for @genderLabel.
  ///
  /// In en, this message translates to:
  /// **'GENDER'**
  String get genderLabel;

  /// No description provided for @onboarding1Title.
  ///
  /// In en, this message translates to:
  /// **'All Pokémon in one place'**
  String get onboarding1Title;

  /// No description provided for @onboarding1Description.
  ///
  /// In en, this message translates to:
  /// **'Access a wide list of Pokémon from all generations created by Nintendo'**
  String get onboarding1Description;

  /// No description provided for @onboarding1Button.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onboarding1Button;

  /// No description provided for @onboarding2Title.
  ///
  /// In en, this message translates to:
  /// **'Keep your Pokédex updated'**
  String get onboarding2Title;

  /// No description provided for @onboarding2Description.
  ///
  /// In en, this message translates to:
  /// **'Register and save your profile, favorite Pokémon, settings, and much more in the app'**
  String get onboarding2Description;

  /// No description provided for @onboarding2Button.
  ///
  /// In en, this message translates to:
  /// **'Let\'s start'**
  String get onboarding2Button;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
