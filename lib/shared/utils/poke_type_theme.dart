import 'package:flutter/material.dart';
import 'package:poke_app/shared/utils/poke_images.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeTypeTheme {
  // Type name constants
  static const String _fire = 'fire';
  static const String _water = 'water';
  static const String _grass = 'grass';
  static const String _electric = 'electric';
  static const String _ice = 'ice';
  static const String _fighting = 'fighting';
  static const String _poison = 'poison';
  static const String _ground = 'ground';
  static const String _flying = 'flying';
  static const String _psychic = 'psychic';
  static const String _bug = 'bug';
  static const String _rock = 'rock';
  static const String _ghost = 'ghost';
  static const String _dragon = 'dragon';
  static const String _dark = 'dark';
  static const String _steel = 'steel';
  static const String _fairy = 'fairy';
  static const String _normal = 'normal';

  // Mapping of type names to their corresponding colors
  static final Map<String, Color> typeColors = {
    _fire: $pokeStyles.colors.fireTypeColor,
    _water: $pokeStyles.colors.waterTypeColor,
    _grass: $pokeStyles.colors.grassTypeColor,
    _electric: $pokeStyles.colors.electricTypeColor,
    _ice: $pokeStyles.colors.iceTypeColor,
    _fighting: $pokeStyles.colors.fightingTypeColor,
    _poison: $pokeStyles.colors.poisonTypeColor,
    _ground: $pokeStyles.colors.groundTypeColor,
    _flying: $pokeStyles.colors.flyingTypeColor,
    _psychic: $pokeStyles.colors.psychicTypeColor,
    _bug: $pokeStyles.colors.bugTypeColor,
    _rock: $pokeStyles.colors.rockTypeColor,
    _ghost: $pokeStyles.colors.ghostTypeColor,
    _dragon: $pokeStyles.colors.dragonTypeColor,
    _dark: $pokeStyles.colors.normalTypeColor,
    _steel: $pokeStyles.colors.steelTypeColor,
    _fairy: $pokeStyles.colors.fairyTypeColor,
    _normal: $pokeStyles.colors.normalTypeColor,
  };

  // Mapping of type names to their corresponding sprite widgets
  static final Map<String, Widget> typeSprites = {
    _fire: PokeImages.fireSprite,
    _water: PokeImages.waterSprite,
    _grass: PokeImages.grassSprite,
    _electric: PokeImages.electricSprite,
    _ice: PokeImages.iceSprite,
    _fighting: PokeImages.fightingSprite,
    _poison: PokeImages.poisonSprite,
    _ground: PokeImages.groundSprite,
    _flying: PokeImages.flyingSprite,
    _psychic: PokeImages.psychicSprite,
    _bug: PokeImages.bugSprite,
    _rock: PokeImages.rockSprite,
    _ghost: PokeImages.ghostSprite,
    _dragon: PokeImages.dragonSprite,
    _dark: PokeImages.darkSprite,
    _steel: PokeImages.steelSprite,
    _fairy: PokeImages.fairySprite,
    _normal: PokeImages.normalSprite,
  };

  // Mapping of type names to their corresponding white sprite widgets
  static final Map<String, Widget> _typeWhiteSprites = {
    _fire: PokeImages.fireWhiteSprite,
    _water: PokeImages.waterWhiteSprite,
    _grass: PokeImages.grassWhiteSprite,
    _electric: PokeImages.electricWhiteSprite,
    _ice: PokeImages.iceWhiteSprite,
    _fighting: PokeImages.fightingWhiteSprite,
    _poison: PokeImages.poisonWhiteSprite,
    _ground: PokeImages.groundWhiteSprite,
    _flying: PokeImages.flyingWhiteSprite,
    _psychic: PokeImages.psychicWhiteSprite,
    _bug: PokeImages.bugWhiteSprite,
    _rock: PokeImages.rockWhiteSprite,
    _ghost: PokeImages.ghostWhiteSprite,
    _dragon: PokeImages.dragonWhiteSprite,
    _dark: PokeImages.darkWhiteSprite,
    _steel: PokeImages.steelWhiteSprite,
    _fairy: PokeImages.fairyWhiteSprite,
    _normal: PokeImages.normalWhiteSprite,
  };

  static Color colorFor(String type) =>
      typeColors[type.toLowerCase()] ?? Colors.grey;

  static Widget spriteFor(String type) =>
      typeSprites[type.toLowerCase()] ?? const SizedBox.shrink();

  static Widget whiteSpriteFor(String type) =>
      _typeWhiteSprites[type.toLowerCase()] ?? PokeImages.waterWhiteSprite;
}
