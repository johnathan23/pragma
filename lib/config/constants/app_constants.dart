import 'environment_constants.dart';

const String kAppName = 'Cat breeds';

const String kTag = '### $kAppName';

const String kPathToEnv = '.env/dev.env';

bool kUseLocalApi = Environment.useLocalApi;
String kApiBaseUrl = Environment.apiBaseUrl;
String kApiKey = Environment.apiKey;
String kBucketUrl = Environment.bucketUrl;

const kApiV1 = 'v1';
