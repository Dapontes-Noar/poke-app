import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poke_app/features/detail/presentation/widgets/poke_detail_app_bar_widget.dart';
import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/shared/utils/poke_type_theme.dart';
import 'package:poke_app/shared/widgets/poke_detail_header_painter.dart';

class PokeDetailHeaderWidget extends StatelessWidget {
  final PokemonDetailResponse pokemon;

  const PokeDetailHeaderWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          child: CustomPaint(
            painter: PokeDetailHeaderPainter(
              color: PokeTypeTheme.colorFor(pokemon.types.first.type.name),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.2,
                margin: const EdgeInsets.only(top: 34),
                child: PokeTypeTheme.whiteSpriteFor(
                  pokemon.types.first.type.name,
                ),
              ),
            ),
          ),
        ),
        // AppBar for detail scree
        Positioned(
          bottom: 0,
          child:
              pokemon.sprites.other != null &&
                  pokemon.sprites.other?.dreamWorld?.frontDefault != null
              ? SvgPicture.network(
                  pokemon.sprites.other?.dreamWorld?.frontDefault ?? '',
                )
              : Image.network(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  filterQuality: FilterQuality.high,
                  pokemon.sprites.frontDefault ?? '',
                  fit: BoxFit.contain,
                ),
        ),
      ],
    );
  }
}
