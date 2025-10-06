import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_app/core/utils/extensions/context_extensions.dart';
import 'package:poke_app/features/home/presentation/notifiers/filter_types_notifier.dart';
import 'package:poke_app/features/home/presentation/widgets/poke_have_filters_widget.dart';
import 'package:poke_app/shared/widgets/poke_types_filter_widget.dart';
import 'package:poke_app/shared/utils/poke_icons.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeHomeAppBarWidget extends ConsumerWidget
    implements PreferredSizeWidget {
  const PokeHomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterStateAsync = ref.watch(filterTypesProvider);
    final hasFilters = filterStateAsync.maybeWhen(
      data: (state) => state.selectedTypes.isNotEmpty,
      orElse: () => false,
    );
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
          enabled: false,
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
            icon: IconTheme(
              data: IconThemeData(
                color: $pokeStyles.text.homeAppBarActionIcon.color,
                size: $pokeStyles.text.homeAppBarActionIcon.fontSize,
              ),
              child: Icon(Icons.filter_list_sharp),
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
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                isDismissible: false,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(context).height * 0.7,
                  minWidth: MediaQuery.sizeOf(context).width,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                builder: (context) => PoketypesFilterWidget(),
              ).whenComplete(() {});
            },
          ),
        ),
      ],
      bottom: hasFilters ? PokeHaveFiltersWidget() : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
