import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeComingSoonWidget extends StatelessWidget {
  final Widget image;
  final String title;
  final String description;

  const PokeComingSoonWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 169, height: 209, child: image),
            MaxGap(16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: $pokeStyles.text.comingSoonTitle,
            ),
            MaxGap(8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: $pokeStyles.text.comingSoonDescription,
            ),
          ],
        ),
      ),
    );
  }
}
