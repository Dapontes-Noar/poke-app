import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_notifier.g.dart';

@Riverpod(keepAlive: true)
class FavoritesNotifier extends _$FavoritesNotifier {
  final List<String> _favorites = [];

  @override
  Future<List<String>> build() async {
    return _favorites;
  }

  bool toggleFavorite(String name) {
    AsyncValue.loading();
    if (_favorites.contains(name)) {
      removeFavorite(name);
      return false;
    } else {
      addFavorite(name);
      return true;
    }
  }

  void addFavorite(String name) {
    if (!_favorites.contains(name)) {
      _favorites.add(name);
      state = AsyncValue.data(List.from(_favorites));
    }
  }

  void removeFavorite(String name) {
    if (_favorites.contains(name)) {
      _favorites.remove(name);
      state = AsyncValue.data(List.from(_favorites));
    }
  }

  bool isFavorite(String name) {
    return _favorites.contains(name);
  }
}
