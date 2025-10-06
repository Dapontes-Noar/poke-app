import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension SvgAssetExtension on String {
  /// Base path for image assets.
  static const String _baseIconsPath = 'assets/icons/';
  static const String _baseImagesPath = 'assets/images/';
  static const String _svgExtension = '.svg';

  /// Converts a string to an SVG icon asset widget.
  Widget toIconSvgAsset({ColorFilter? colorFilter}) => SvgPicture.asset(
    '$_baseIconsPath$this$_svgExtension',
    colorFilter: colorFilter,
    width: 24,
    height: 24,
  );

  Image toImagePngAsset() =>
      Image.asset('$_baseImagesPath$this.png', width: 24, height: 24);

  /// Converts a string to an SVG asset widget.
  Widget toImageSvgAsset({ColorFilter? colorFilter}) => SvgPicture.asset(
    '$_baseImagesPath$this$_svgExtension',
    colorFilter: colorFilter,
  );
}
