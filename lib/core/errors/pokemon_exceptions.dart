class PokemonNetworkException implements Exception {
  final String message;
  final Object? originalError;
  final StackTrace? stackTrace;

  PokemonNetworkException(this.message, {this.originalError, this.stackTrace});

  @override
  String toString() => 'PokemonNetworkException: $message';
}

class PokemonApiException implements Exception {
  final String message;
  final Object? originalError;
  final StackTrace? stackTrace;

  PokemonApiException(this.message, {this.originalError, this.stackTrace});

  @override
  String toString() => 'PokemonApiException: $message';
}

