import 'package:shared_preferences/shared_preferences.dart';

class ApplicationConfig {
  static final ApplicationConfig _singleton = ApplicationConfig._internal();
  String? serviceUrl;
  factory ApplicationConfig() {
    return _singleton;
  }

  ApplicationConfig._internal();
}