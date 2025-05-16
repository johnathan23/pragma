part of 'api_client.dart';

class DioConfig {
  static Dio createDio({required String url}) {
    Dio dio = Dio();
    dio.options = BaseOptions(
      baseUrl: url,
      receiveTimeout: k20sec,
      connectTimeout: k20sec,
      sendTimeout: k20sec,
      contentType: 'application/json',
      headers: {'x-api-key': kApiKey},
    );
    dio.interceptors.clear();
    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // * -- add custom header in all request or add the custom validation to add custom header when the request required
          // * -- (in this case add custom header for once request and other for everyone else request)
          switch (options.path) {
            case '$kApiV1/signIn':
              // * -- do nothing and continue
              return handler.next(options);

            default:
              // * -- add bearer in request
              options.headers['Authorization'] = 'Bearer ${''}';
              break;
          }
          return handler.next(options);
        },
      ),
    );
    return dio;
  }
}
