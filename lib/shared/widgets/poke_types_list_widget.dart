import 'package:flutter/material.dart';
import 'package:poke_app/core/utils/extensions/string_extensions.dart';
import 'package:poke_app/features/home/data/models/pokemon_type_response.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeTypesListWidget extends StatelessWidget {
  final List<TypeInfoResponse> types;
  final bool Function(String) isSelected;
  final void Function(String) onTypeToggle;

  const PokeTypesListWidget({
    super.key,
    required this.types,
    required this.isSelected,
    required this.onTypeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: types.length,
      itemBuilder: (context, index) {
        final type = types[index];
        final selected = isSelected(type.name);
        return Row(
          children: [
            Text(
              type.name.toCapitalize(),
              style: $pokeStyles.text.filterOptionsLabel,
            ),
            const Spacer(),
            Checkbox(
              activeColor: $pokeStyles.colors.filterCheckboxCheckColor,
              side: BorderSide(
                color: $pokeStyles.colors.filterCheckboxSideColor,
                width: 1.5,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              value: selected,
              onChanged: (_) => onTypeToggle(type.name),
            ),
          ],
        );
      },
    );
  }
}
