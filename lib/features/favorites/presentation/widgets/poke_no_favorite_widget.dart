import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/core/utils/extensions/context_extensions.dart';
import 'package:poke_app/shared/utils/poke_images.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeNoFavoriteWidget extends StatelessWidget {
  const PokeNoFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: $pokeStyles.colors.scaffoldBgColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 185,
                height: 214.87,
                child: PokeImages.errorMagikarpImage,
              ),
              MaxGap(16),
              Text(
                context.l10n.noFavoritesTitle,
                textAlign: TextAlign.center,
                style: $pokeStyles.text.noFavoritesTitle,
              ),
              MaxGap(8),
              Text(
                context.l10n.noFavoritesDescription,
                textAlign: TextAlign.center,
                style: $pokeStyles.text.noFavoritesDescription,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
