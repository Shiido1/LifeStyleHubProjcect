enum Environment { development, staging, qa, production }

class UrlConfig {
  static Environment environment = Environment.staging;
  static const String STAGING_URL = "https://lsh.reimnet.com/";
  static const String PRODUCTION_URL = "https://lsh.reimnet.com/";
  static final coreBaseUrl =
      environment == Environment.production ? PRODUCTION_URL : STAGING_URL;
}
