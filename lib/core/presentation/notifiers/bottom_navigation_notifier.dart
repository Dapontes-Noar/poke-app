import 'package:go_router/go_router.dart';
import 'package:poke_app/routes/app_router.dart';
import 'package:poke_app/routes/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_navigation_notifier.g.dart';

@riverpod
class BottomNavigationNotifier extends _$BottomNavigationNotifier {
  late final GoRouter _router;

  static const List<String> _routes = [
    Routes.home,
    Routes.regions,
    Routes.favorites,
    Routes.profile,
  ];

  @override
  int build() {
    _router = ref.read(buildAppRouterProvider);
    return 0;
  }

  void onTabSelected(int index) {
    if (index == state) return;
    state = index;
    final route = _routes[index];
    _router.go(route);
  }

  void syncWithRoute(String location) {
    final idx = _routes.indexWhere((route) => location.startsWith(route));
    state = idx >= 0 ? idx : 0;
  }

  String routeForIndex(int index) => _routes[index];
}
