import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_app/core/presentation/notifiers/bottom_navigation_notifier.dart';
import 'package:poke_app/shared/utils/poke_icons.dart';
import 'package:poke_app/styles/poke_styles.dart';
import 'package:poke_app/core/utils/extensions/context_extensions.dart';

class PokeBottomNavigationBar extends ConsumerWidget {
  const PokeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavigationProvider);
    return BottomNavigationBar(
      unselectedItemColor:
          $pokeStyles.colors.bottomNavigationLabelUnselectColor,
      selectedItemColor: $pokeStyles.colors.bottomNavigationLabelSelectColor,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: PokeIcons.homeIcon,
          label: context.l10n.homeTitle,
        ),
        BottomNavigationBarItem(
          icon: PokeIcons.regionIcon,
          label: context.l10n.regionsTitle,
        ),
        BottomNavigationBarItem(
          icon: PokeIcons.favoriteIcon,
          label: context.l10n.favoritesTitle,
        ),
        BottomNavigationBarItem(
          icon: PokeIcons.profileIcon,
          label: context.l10n.profileTitle,
        ),
      ],
      currentIndex: currentIndex,
      onTap: (optionPosition) {
        ref
            .read(bottomNavigationProvider.notifier)
            .onTabSelected(optionPosition);
      },
    );
  }
}
