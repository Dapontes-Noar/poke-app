import 'package:flutter/material.dart';
import 'package:poke_app/shared/extensions/svg_asset_extension.dart';
import 'package:poke_app/shared/utils/poke_icons_constants.dart';

class PokeIcons {
  static Widget favoriteIcon({Color? color}) =>
      PokeIconsConstants.favoriteIcon.toIconSvgAsset(
        colorFilter: color != null
            ? ColorFilter.mode(color, BlendMode.srcIn)
            : null,
      );

  static Widget homeIcon({Color? color}) =>
      PokeIconsConstants.homeIcon.toIconSvgAsset(
        colorFilter: color != null
            ? ColorFilter.mode(color, BlendMode.srcIn)
            : null,
      );

  static Widget profileIcon({Color? color}) =>
      PokeIconsConstants.profileIcon.toIconSvgAsset(
        colorFilter: color != null
            ? ColorFilter.mode(color, BlendMode.srcIn)
            : null,
      );

  static Widget regionIcon({Color? color}) =>
      PokeIconsConstants.regionIcon.toIconSvgAsset(
        colorFilter: color != null
            ? ColorFilter.mode(color, BlendMode.srcIn)
            : null,
      );

  static final deleteIcon = PokeIconsConstants.deleteIcon.toIconSvgAsset();
  static final searchIcon = PokeIconsConstants.searchIcon.toIconSvgAsset();
}
