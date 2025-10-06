import 'package:flutter/material.dart';
import 'package:poke_app/shared/widgets/poke_bottom_navigation_bar_widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shared_providers.g.dart';

@Riverpod(keepAlive: true)
Widget pokeBottomNavigationBar(Ref ref) => const PokeBottomNavigationBarWidget();
