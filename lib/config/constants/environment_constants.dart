import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app_constants.dart';

class Environment {
  static final String _keyUseLocalApi = 'USE_LOCAL_API';
  static final String _keyApiBaseUrl = 'API_ENDPOINT';
  static final String _keyApiKey = 'API_KEY';
  static final String _keyBucketUrl = 'BUCKET_URL';

  static Future<void> _loadEnvironmentData(String fileName) async {
    try {
      await dotenv.load(fileName: fileName);
    } catch (error) {
      throw Exception('Failed to load environment variables from env file: $error');
    }
  }

  static Future<void> load() => _loadEnvironmentData(kPathToEnv);

  static String? _getValue({required String key}) => dotenv.get(key);

  static bool _getBoolValue({required String key}) => dotenv.getBool(key, fallback: true);
  // ? ----------- Add values here -----------

  static bool get useLocalApi => _getBoolValue(key: _keyUseLocalApi);
  static set useLocalApi(bool value) => dotenv.env[_keyUseLocalApi] = value.toString();

  static String get apiBaseUrl => _getValue(key: _keyApiBaseUrl) ?? '';
  static set apiBaseUrl(String value) => dotenv.env[_keyApiBaseUrl] = value;

  static String get apiKey => _getValue(key: _keyApiKey) ?? '';
  static set apiKey(String value) => dotenv.env[_keyApiKey] = value;

  static String get bucketUrl => _getValue(key: _keyBucketUrl) ?? '';
  static set bucketUrl(String value) => dotenv.env[_keyBucketUrl] = value;
}
