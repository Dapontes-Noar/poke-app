import 'package:flutter/material.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeFilterHeaderWidget extends StatelessWidget {
  final VoidCallback onClose;
  final String title;
  final TextStyle? titleStyle;

  const PokeFilterHeaderWidget({
    super.key,
    required this.onClose,
    required this.title,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(icon: const Icon(Icons.close), onPressed: onClose),
        ),
        Text(
          title,
          style: titleStyle ?? $pokeStyles.text.pokeSubTitleIcon,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
