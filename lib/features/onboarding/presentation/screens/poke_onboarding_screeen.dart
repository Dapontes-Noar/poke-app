import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/core/utils/extensions/context_extensions.dart';
import 'package:poke_app/features/onboarding/presentation/widgets/poke_onboarding_page_widget.dart';
import 'package:poke_app/routes/routes.dart';
import 'package:poke_app/shared/utils/poke_images.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeOnboardingScreen extends StatefulWidget {
  const PokeOnboardingScreen({super.key});

  @override
  State<PokeOnboardingScreen> createState() => _PokeOnboardingScreenState();
}

class _PokeOnboardingScreenState extends State<PokeOnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final slides = [
      PokeOnboardingPageWidget(
        image: PokeImages.playImage,
        title: context.l10n.onboarding1Title,
        description: context.l10n.onboarding1Description,
        buttonText: context.l10n.onboarding1Button,
        onPressed: () => _controller.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
        isLast: false,
      ),
      PokeOnboardingPageWidget(
        image: PokeImages.hildaImage,
        title: context.l10n.onboarding2Title,
        description: context.l10n.onboarding2Description,
        buttonText: context.l10n.onboarding2Button,
        onPressed: () => context.pushReplacement(Routes.home),
        isLast: true,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: _onPageChanged,
                  children: slides,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    slides.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 20 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? $pokeStyles.colors.filterCheckboxCheckColor
                            : $pokeStyles.colors.filterCheckboxCheckColor
                                  .withAlpha(80),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              Gap(24),
              ElevatedButton(
                onPressed: () {
                  slides[_currentPage].onPressed();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(58),
                  backgroundColor: $pokeStyles.colors.filterPrimaryButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Text(
                  slides[_currentPage].isLast
                      ? context.l10n.onboarding2Button
                      : context.l10n.onboarding1Button,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
