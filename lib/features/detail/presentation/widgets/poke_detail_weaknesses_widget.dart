import 'package:flutter/material.dart';
import 'package:poke_app/features/home/presentation/widgets/poke_type_chip_widget.dart';
import 'package:poke_app/styles/poke_styles.dart';
import 'package:poke_app/core/utils/extensions/context_extensions.dart';

/// Widget that displays the weaknesses (double damage from types) for a Pokémon.
class PokeDetailWeaknessesWidget extends StatelessWidget {
  final List<dynamic>? doubleDamageFrom;

  const PokeDetailWeaknessesWidget({super.key, this.doubleDamageFrom});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            l10n.weaknessesLabel,
            textAlign: TextAlign.center,
            style: $pokeStyles.text.comingSoonTitle,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                doubleDamageFrom
                    ?.map((type) => PokeTypeChipWidget(pokemonType: type))
                    .toList() ??
                [],
          ),
        ],
      ),
    );
  }
}
