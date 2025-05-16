import 'package:dio/dio.dart';
import 'package:pragma_exam/config/constants/app_constants.dart';
import 'package:pragma_exam/config/theme/app_dimensions.dart';
import 'package:pragma_exam/core/domain/entities/data/cat_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'dio_config.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient({String? otherUrl}) {
    return _ApiClient(DioConfig.createDio(url: otherUrl ?? kApiBaseUrl));
  }

  // ? --------- ENDPOINTS ---------
  @GET('/$kApiV1/breeds')
  Future<List<CatEntity>> getPortfolio(@Query('limit') int limit, @Query('page') int page);
}
