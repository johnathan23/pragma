import 'environment_constants.dart';

const String kAppName = 'Portfolio';

const String kTag = '### $kAppName';

const String kPathToEnv = '.env/dev.env';

bool kUseLocalApi = Environment.useLocalApi;
String kApiBaseUrl = Environment.apiBaseUrl;
String kApiKey = Environment.apiKey;

const kApiV1 = 'v1';
