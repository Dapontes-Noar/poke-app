import 'package:flutter/material.dart';
import 'package:poke_app/shared/extensions/svg_asset_extension.dart';
import 'package:poke_app/shared/utils/poke_icons_constants.dart';

class PokeIcons {
  static final Widget favoriteIcon = PokeIconsConstants.favoriteIcon
      .toIconSvgAsset();
  static final Widget homeIcon = PokeIconsConstants.homeIcon.toIconSvgAsset();
  static final Widget profileIcon = PokeIconsConstants.profileIcon
      .toIconSvgAsset();
  static final Widget regionIcon = PokeIconsConstants.regionIcon
      .toIconSvgAsset();
}
