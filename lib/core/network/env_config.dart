enum Environment {
  development(
    baseUrl: "https://api.dev.com/",
  ),
  production(
    baseUrl: "https://api.prod.com/",
  ),
  beta(
    baseUrl: "https://api.beta.com/"
  );

  final String baseUrl;

  const Environment({required this.baseUrl});
}

class EnvironmentConfig {
  static Environment environment = Environment.production;

  static String getBaseUrl() => environment.baseUrl;
}
