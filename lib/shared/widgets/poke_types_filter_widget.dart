import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_app/core/utils/extensions/context_extensions.dart';
import 'package:poke_app/features/home/presentation/notifiers/filter_types_notifier.dart';
import 'package:poke_app/styles/poke_styles.dart';
import 'package:poke_app/shared/widgets/poke_filter_actions_widget.dart';
import 'package:poke_app/shared/widgets/poke_filter_header_widget.dart';
import 'package:poke_app/shared/widgets/poke_types_list_widget.dart';

class PoketypesFilterWidget extends ConsumerStatefulWidget {
  const PoketypesFilterWidget({super.key});

  @override
  ConsumerState<PoketypesFilterWidget> createState() =>
      _PoKetypesFilterWidgetState();
}

class _PoKetypesFilterWidgetState extends ConsumerState<PoketypesFilterWidget> {
  late final FilterTypesNotifier _typeNotifier;

  @override
  void initState() {
    super.initState();
    _typeNotifier = ref.read(filterTypesProvider.notifier);
    _typeNotifier.unifySelectedTypes();
  }

  @override
  Widget build(BuildContext context) {
    final typesAsync = ref.watch(filterTypesProvider);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Header
          PokeFilterHeaderWidget(
            onClose: () {
              Navigator.of(context).pop();
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _typeNotifier.cancelSelection();
              });
            },
            title: context.l10n.filterTitle,
            titleStyle: $pokeStyles.text.pokeSubTitleIcon,
          ),
          MaxGap(32),
          Row(
            children: [
              Text(
                context.l10n.filterTypes,
                style: $pokeStyles.text.pokeSubTitleIcon,
              ),
              const Spacer(),
              Icon(Icons.keyboard_arrow_up),
            ],
          ),
          const Divider(),
          // List
          Flexible(
            flex: 20,
            fit: FlexFit.tight,
            child: typesAsync.when(
              data: (typesResponse) {
                final types = typesResponse.allTypesResponse?.results;
                return PokeTypesListWidget(
                  types: types ?? [],
                  isSelected: _typeNotifier.isSelected,
                  onTypeToggle: (name) {
                    setState(() {
                      _typeNotifier.toggleTypeSelection(name);
                    });
                  },
                );
              },
              error: (e, _) => Center(
                child: Text(
                  context.l10n.filterErrorTypes(e.toString()),
                  style: $pokeStyles.text.pokeName.copyWith(fontSize: 14),
                ),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
          const Divider(),
          MaxGap(24),
          // Buttons
          PokeFilterActionsWidget(
            onApply: () {
              Navigator.of(context).pop();
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _typeNotifier.applySelection();
              });
            },
            onCancel: () {
              Navigator.of(context).pop();
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _typeNotifier.cancelSelection();
              });
            },
            applyLabel: context.l10n.filterApply,
            cancelLabel: context.l10n.filterCancel,
          ),
        ],
      ),
    );
  }
}
