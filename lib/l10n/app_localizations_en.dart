// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get homeTitle => 'Pokedex';

  @override
  String get regionsTitle => 'Regions';

  @override
  String get favoritesTitle => 'Favorites';

  @override
  String get profileTitle => 'Profile';

  @override
  String get comingSoonTitle => 'Coming soon!';

  @override
  String get comingSoonDescription =>
      'We are working to bring you this section. Come back later to discover all the news.';

  @override
  String get noFavoritesTitle => 'You haven\'t marked any Pokémon as favorite';

  @override
  String get noFavoritesDescription =>
      'Click the heart icon on your favorite Pokémon and they will appear here.';

  @override
  String get homeSearchHint => 'Search Pokémon...';

  @override
  String get filterTitle => 'Filter by your preferences';

  @override
  String get filterTypes => 'Types';

  @override
  String get filterApply => 'Apply';

  @override
  String get filterCancel => 'Cancel';

  @override
  String filterErrorTypes(Object error) {
    return 'Error loading types: $error';
  }

  @override
  String get filterFoundPrefix => 'Found ';

  @override
  String filterFoundResults(Object count) {
    return '$count results';
  }

  @override
  String get filterClear => 'Clear filter';

  @override
  String get generalErrorTitle => 'Something went wrong...';

  @override
  String get generalErrorDescription =>
      'We couldn\'t load the information at this time. Please check your connection or try again later.';

  @override
  String get generalErrorRetry => 'Retry';

  @override
  String get pokemonGeneralDescription =>
      'Pokémon are mysterious creatures with unique abilities and characteristics. Each Pokémon has its own strengths, weaknesses, and evolutionary path. They inhabit diverse environments and form bonds with trainers around the world.';

  @override
  String get weightLabel => 'WEIGHT';

  @override
  String get heightLabel => 'HEIGHT';

  @override
  String get categoryLabel => 'CATEGORY';

  @override
  String get abilityLabel => 'ABILITY';

  @override
  String get weaknessesLabel => 'Weaknesses';

  @override
  String get genderLabel => 'GENDER';

  @override
  String get onboarding1Title => 'All Pokémon in one place';

  @override
  String get onboarding1Description =>
      'Access a wide list of Pokémon from all generations created by Nintendo';

  @override
  String get onboarding1Button => 'Continue';

  @override
  String get onboarding2Title => 'Keep your Pokédex updated';

  @override
  String get onboarding2Description =>
      'Register and save your profile, favorite Pokémon, settings, and much more in the app';

  @override
  String get onboarding2Button => 'Let\'s start';
}
