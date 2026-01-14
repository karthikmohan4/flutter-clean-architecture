import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavor { dev, staging, production }

class F {
  static  Flavor ?appFlavor;

  static String get name => appFlavor?.name??"";  

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return dotenv.env['DEV_URL'].toString();
      case Flavor.staging:
        return dotenv.env['STAGING_URL'].toString();
      case Flavor.production:
        return dotenv.env['PROD_URL'].toString();
      default:
        return '';
    }
  }

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Enterprise Dev';
      case Flavor.staging:
        return 'Enterprise Staging';
      case Flavor.production:
        return 'Enterprise';
      default:
        return '';
    }
  }
}
