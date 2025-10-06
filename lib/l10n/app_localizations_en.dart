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
}
