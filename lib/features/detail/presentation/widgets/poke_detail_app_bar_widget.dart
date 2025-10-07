import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/features/home/presentation/widgets/poke_favorite_button_widget.dart';

class PokeDetailAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String pokemonName;

  @override
  const PokeDetailAppBarWidget({super.key, required this.pokemonName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 100,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        onPressed: context.canPop() ? context.pop : null,
      ),
      actions: [
        PokeFavoriteButtonWidget(
          pokemonName: pokemonName,
          bgColor: Colors.transparent,
          hasBorder: false,
          iconSize: 28,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
