import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_app/shared/di/shared_providers.dart';
import 'package:poke_app/shared/utils/poke_images.dart';
import 'package:poke_app/shared/widgets/poke_bottom_navigation_bar.dart';

class PokeRegionsScreen extends ConsumerWidget {
  const PokeRegionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavBar = ref.watch(pokeBottomNavigationBarProvider);
    return Scaffold(
      bottomNavigationBar: bottomNavBar,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 169,
                height: 209,
                child: PokeImages.commingSoonJigglypuffImage,
              ),
              MaxGap(16),
              Text(
                '¡Muy pronto disponible!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              MaxGap(8),
              Text(
                'Estamos trabajando para traerte esta sección. Vuelve más adelante para descubrir todas las novedades.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
