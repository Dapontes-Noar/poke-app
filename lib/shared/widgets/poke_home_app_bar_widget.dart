import 'package:flutter/material.dart';
import 'package:poke_app/core/utils/extensions/context_extensions.dart';
import 'package:poke_app/shared/utils/poke_icons.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeHomeAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const PokeHomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      actionsPadding: const EdgeInsets.only(right: 16),
      toolbarHeight: 100,
      elevation: 0,
      leading: null,
      title: Padding(
        padding: $pokeStyles.padding.homeAppBarTitlePadding,
        child: SearchBar(
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          padding: WidgetStatePropertyAll(
            $pokeStyles.padding.homeAppBarSearchPadding,
          ),
          elevation: WidgetStatePropertyAll(0),
          side: WidgetStatePropertyAll(
            $pokeStyles.container.homeAppBarActionBorderSide,
          ),
          hintStyle: WidgetStatePropertyAll(
            $pokeStyles.text.homeAppBarSearchHint,
          ),
          textStyle: WidgetStatePropertyAll(
            $pokeStyles.text.homeAppBarSearchInput,
          ),
          leading: PokeIcons.searchIcon,
          hintText: context.l10n.homeSearchHint,
        ),
      ),
      actions: [
        Padding(
          padding: $pokeStyles.padding.homeAppBarActionPadding,
          child: IconButton(
            onPressed: () {},
            icon: SizedBox(
              width: 20,
              height: 20,
              child: IconTheme(
                data: IconThemeData(
                  color: $pokeStyles.text.homeAppBarActionIcon.color,
                  size: $pokeStyles.text.homeAppBarActionIcon.fontSize,
                ),
                child: PokeIcons.searchIcon,
              ),
            ),
            style: ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.all(22)),
              backgroundColor: WidgetStatePropertyAll(Colors.transparent),
              shape: WidgetStatePropertyAll(
                $pokeStyles.container.homeAppBarActionBorderRadius,
              ),
              side: WidgetStatePropertyAll(
                $pokeStyles.container.homeAppBarActionBorderSide,
              ),
            ),
            visualDensity: VisualDensity.comfortable,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
