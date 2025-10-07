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

  @override
  String get homeSearchHint => 'Buscar Pokémon...';

  @override
  String get filterTitle => 'Filtra por tus preferencias';

  @override
  String get filterTypes => 'Tipos';

  @override
  String get filterApply => 'Aplicar';

  @override
  String get filterCancel => 'Cancelar';

  @override
  String filterErrorTypes(Object error) {
    return 'Error al cargar los tipos: $error';
  }

  @override
  String get filterFoundPrefix => 'Se han encontrado ';

  @override
  String filterFoundResults(Object count) {
    return '$count resultados';
  }

  @override
  String get filterClear => 'Borrar filtro';

  @override
  String get generalErrorTitle => 'Algo salió mal...';

  @override
  String get generalErrorDescription =>
      'No pudimos cargar la información en este momento. Verifica tu conexión o intenta nuevamente más tarde.';

  @override
  String get generalErrorRetry => 'Reintentar';

  @override
  String get pokemonGeneralDescription =>
      'Los Pokémon son criaturas misteriosas con habilidades y características únicas. Cada uno posee fortalezas, debilidades y una evolución propia. Habitan entornos diversos y forman lazos con entrenadores de todo el mundo.';

  @override
  String get weightLabel => 'PESO';

  @override
  String get heightLabel => 'ALTURA';

  @override
  String get categoryLabel => 'CATEGORÍA';

  @override
  String get abilityLabel => 'HABILIDAD';

  @override
  String get weaknessesLabel => 'Debilidades';

  @override
  String get genderLabel => 'GÉNERO';

  @override
  String get onboarding1Title => 'Todos los Pokémon en un solo lugar';

  @override
  String get onboarding1Description =>
      'Accede a una amplia lista de Pokémon de todas las generaciones creadas por Nintendo';

  @override
  String get onboarding1Button => 'Continuar';

  @override
  String get onboarding2Title => 'Mantén tu Pokédex actualizada';

  @override
  String get onboarding2Description =>
      'Regístrate y guarda tu perfil, Pokémon favoritos, configuraciones y mucho más en la aplicación';

  @override
  String get onboarding2Button => 'Empecemos';
}
