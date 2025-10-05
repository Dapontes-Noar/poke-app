import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension SvgAssetExtension on String {
  static const String _basePath = 'assets/images/';
  static const String _svgExtension = '.svg';

  /// Converts a string to an SVG asset widget.
  Widget toImageSvgAsset({ColorFilter? colorFilter}) =>
      SvgPicture.asset('$_basePath$this$_svgExtension', colorFilter: colorFilter);
}
