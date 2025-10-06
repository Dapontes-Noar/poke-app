import 'package:flutter/material.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeFilterActionsWidget extends StatelessWidget {
  final VoidCallback onApply;
  final VoidCallback onCancel;
  final String applyLabel;
  final String cancelLabel;

  const PokeFilterActionsWidget({
    super.key,
    required this.onApply,
    required this.onCancel,
    required this.applyLabel,
    required this.cancelLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: $pokeStyles.colors.filterPrimaryButtonColor,
              textStyle: const TextStyle(color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: onApply,
            child: Text(
              applyLabel,
              style: $pokeStyles.text.pokeButtonLabel.copyWith(
                color: $pokeStyles.colors.scaffoldBgColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: $pokeStyles.colors.filterSecondaryButtonColor,
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: onCancel,
            child: Text(
              cancelLabel,
              style: $pokeStyles.text.pokeButtonLabel,
            ),
          ),
        ),
      ],
    );
  }
}

