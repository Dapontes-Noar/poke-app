import 'package:flutter/material.dart';
import 'package:poke_app/core/utils/extensions/context_extensions.dart';
import 'package:poke_app/shared/utils/poke_images.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeGeneralErrorWidget extends StatelessWidget {
  final VoidCallback onRetry;

  const PokeGeneralErrorWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 185,
              height: 214.87,
              child: PokeImages.errorMagikarpImage,
            ),
            const SizedBox(height: 24),
            Text(
              context.l10n.generalErrorTitle,
              style: $pokeStyles.text.comingSoonTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              context.l10n.generalErrorDescription,
              style: $pokeStyles.text.comingSoonDescription,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: $pokeStyles.colors.filterPrimaryButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  context.l10n.generalErrorRetry,
                  style: $pokeStyles.text.pokeButtonLabel,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
