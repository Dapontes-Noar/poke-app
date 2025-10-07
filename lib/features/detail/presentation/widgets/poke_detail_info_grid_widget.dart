import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:poke_app/core/utils/extensions/context_extensions.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeDetailInfoGridWidget extends StatelessWidget {
  final String weight;
  final String height;
  final String category;
  final String ability;
  final List<Widget> icons;

  const PokeDetailInfoGridWidget({
    super.key,
    required this.weight,
    required this.height,
    required this.category,
    required this.ability,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return GridView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1.5,
      ),
      children: [
        _InfoCard(icon: icons[0], title: l10n.weightLabel, value: weight),
        _InfoCard(icon: icons[1], title: l10n.heightLabel, value: height),
        _InfoCard(icon: icons[2], title: l10n.categoryLabel, value: category),
        _InfoCard(icon: icons[3], title: l10n.abilityLabel, value: ability),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Widget icon;

  const _InfoCard({
    required this.title,
    required this.value,
    this.icon = const Icon(Icons.info),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            icon,
            Gap(6),
            Text(
              title,
              textAlign: TextAlign.left,
              style: $pokeStyles.text.pokeMeasuresLabel,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: $pokeStyles.colors.filterSecondaryButtonColor,
              width: 1,
            ),
          ),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: $pokeStyles.text.pokeButtonLabel,
          ),
        ),
      ],
    );
  }
}
