import 'package:flutter/cupertino.dart';

class PokeHaveFiltersWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const PokeHaveFiltersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Se han encontrado 3 resultados borrar filtro');
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
