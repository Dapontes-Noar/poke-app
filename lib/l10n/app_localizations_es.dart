// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get homeTitle => 'Pokédex';

  @override
  String get regionsTitle => 'Regiones';

  @override
  String get favoritesTitle => 'Favoritos';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get comingSoonTitle => 'Coming soon!';

  @override
  String get comingSoonDescription =>
      'We are working to bring you this section. Come back later to discover all the news.';

  @override
  String get noFavoritesTitle => 'No has marcado ningún Pokémon como favorito';

  @override
  String get noFavoritesDescription =>
      'Haz clic en el ícono de corazón de tus Pokémon favoritos y aparecerán aquí.';
}
