import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBack;
  final List<Widget>? actions;

  const PokeAppBarWidget({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.onBack,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 84,
      backgroundColor: Colors.transparent,
      title: Text(title, style: $pokeStyles.text.pokeAppBarTitle),
      leading: showBackButton
          ? IconButton(
              onPressed:
                  onBack ?? () => context.canPop() ? context.pop() : null,
              icon: const Icon(Icons.arrow_back_ios_new),
            )
          : null,
      actions: actions,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(84);
}
