import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_app/core/utils/extensions/context_extensions.dart';
import 'package:poke_app/features/home/presentation/notifiers/filter_types_notifier.dart';
import 'package:poke_app/features/home/presentation/notifiers/home_notifier.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeHaveFiltersWidget extends ConsumerWidget
    implements PreferredSizeWidget {
  const PokeHaveFiltersWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonsAsync = ref.watch(homeNotifierProvider);
    final filterNotifier = ref.read(filterTypesProvider.notifier);
    final homeNotifier = ref.read(homeNotifierProvider.notifier);
    final results = pokemonsAsync.maybeWhen(
      data: (state) => state.results.length,
      orElse: () => 0,
    );
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            context.l10n.filterFoundPrefix,
            style: $pokeStyles.text.navBarFilterLabel.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            context.l10n.filterFoundResults(results.toString()),
            style: $pokeStyles.text.navBarFilterLabel,
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              filterNotifier.applySelection();
              filterNotifier.cleanTemporaryTypes();
              filterNotifier.cancelSelection();
              homeNotifier.updateAllPokemons();
            },
            child: Text(
              context.l10n.filterClear,
              style: $pokeStyles.text.navBarFilterCleanLabel,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
