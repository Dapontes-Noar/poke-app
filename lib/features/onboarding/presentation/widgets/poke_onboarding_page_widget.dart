import 'package:flutter/material.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeOnboardingPageWidget extends StatelessWidget {
  final Widget image;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;
  final bool isLast;

  const PokeOnboardingPageWidget({
    required this.image,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(19.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: SizedBox(width: 251, height: 251, child: image)),
          const SizedBox(height: 24),
          Text(
            title,
            textAlign: TextAlign.center,
            style: $pokeStyles.text.pokeDetailName,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            textAlign: TextAlign.center,
            style: $pokeStyles.text.pokeDetailDescription,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
