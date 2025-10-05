import 'package:flutter/material.dart';
import 'package:poke_app/shared/extensions/svg_asset_extension.dart';

class PokeImages {
  static const String _fireSprite = 'fire_sprite';
  static const String _fireSpriteBackground = 'fire_white_sprite';

  static final Widget fireSprite = _fireSprite.toImageSvgAsset();
  static final Widget fireSpriteWhite = _fireSpriteBackground.toImageSvgAsset();
}
