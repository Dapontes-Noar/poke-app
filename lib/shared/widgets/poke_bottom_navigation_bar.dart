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
    final navNotifier = ref.read(bottomNavigationProvider.notifier);
    Color iconsColor(int index) => navNotifier.isCurrentIndex(index)
        ? $pokeStyles.colors.bottomNavigationLabelSelectColor
        : $pokeStyles.colors.bottomNavigationLabelUnselectColor;
    return BottomNavigationBar(
      unselectedItemColor:
          $pokeStyles.colors.bottomNavigationLabelUnselectColor,
      selectedItemColor: $pokeStyles.colors.bottomNavigationLabelSelectColor,
      selectedIconTheme: IconThemeData(
        color: $pokeStyles.colors.bottomNavigationLabelSelectColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: $pokeStyles.colors.bottomNavigationLabelUnselectColor,
      ),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: PokeIcons.homeIcon(color: iconsColor(0)),
          label: context.l10n.homeTitle,
        ),
        BottomNavigationBarItem(
          icon: PokeIcons.regionIcon(color: iconsColor(1)),
          label: context.l10n.regionsTitle,
        ),
        BottomNavigationBarItem(
          icon: PokeIcons.favoriteIcon(color: iconsColor(2)),
          label: context.l10n.favoritesTitle,
        ),
        BottomNavigationBarItem(
          icon: PokeIcons.profileIcon(color: iconsColor(3)),
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
