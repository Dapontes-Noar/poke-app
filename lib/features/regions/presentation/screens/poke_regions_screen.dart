import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_app/core/utils/extensions/context_extensions.dart';
import 'package:poke_app/shared/di/shared_providers.dart';
import 'package:poke_app/shared/utils/poke_images.dart';
import 'package:poke_app/shared/widgets/poke_coming_soon_widget.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeRegionsScreen extends ConsumerWidget {
  const PokeRegionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavBar = ref.watch(pokeBottomNavigationBarProvider);
    return Scaffold(
      bottomNavigationBar: bottomNavBar,
      backgroundColor: $pokeStyles.colors.scaffoldBgColor,
      body: PokeComingSoonWidget(
        image: PokeImages.commingSoonJigglypuffImage,
        title: context.l10n.comingSoonTitle,
        description: context.l10n.comingSoonDescription,
      ),
    );
  }
}
