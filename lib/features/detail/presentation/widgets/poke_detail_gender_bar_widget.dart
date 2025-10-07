import 'package:flutter/material.dart';
import 'package:poke_app/core/utils/extensions/context_extensions.dart';
import 'package:poke_app/shared/utils/poke_icons.dart';
import 'package:poke_app/styles/poke_styles.dart';

/// Widget to display the gender bar and percentages for a Pokémon.
class PokeDetailGenderBarWidget extends StatelessWidget {
  final int genderRate;

  const PokeDetailGenderBarWidget({super.key, required this.genderRate});

  @override
  Widget build(BuildContext context) {
    final malePercent = (10 - genderRate) * 10;
    final femalePercent = genderRate * 10;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          context.l10n.genderLabel,
          style: $pokeStyles.text.pokeMeasuresLabel,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Row(
          spacing: 0,
          children: [
            Expanded(
              flex: malePercent,
              child: Container(
                height: 8,
                decoration: BoxDecoration(
                  color: $pokeStyles.colors.femaleGenderColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: femalePercent,
              child: Container(
                height: 8,
                decoration: BoxDecoration(
                  color: $pokeStyles.colors.maleGenderColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: SizedBox(
                      width: 18,
                      height: 18,
                      child: PokeIcons.maleIcon,
                    ),
                  ),
                  TextSpan(
                    text: ' $malePercent%',
                    style: $pokeStyles.text.pokeMeasuresLabel,
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: SizedBox(
                      width: 18,
                      height: 18,
                      child: PokeIcons.femaleIcon,
                    ),
                  ),
                  TextSpan(
                    text: ' $femalePercent%',
                    style: $pokeStyles.text.pokeMeasuresLabel,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
