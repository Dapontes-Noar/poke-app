class ApiConstants {
  //TODO: remember to change the base URL to the production one
  static const String defaultBaseUrl = 'https://pokeapi.co/api/v2/';
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: defaultBaseUrl,
  );

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': '*/*',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'Content-Type',
  };

  static const int statusOk = 200;
  static const int statusNotFound = 404;
  static const int statusInternalServerError = 500;

  static const String authorizationHeader = 'Authorization';
  static const String bearerPrefix = 'Bearer ';
}