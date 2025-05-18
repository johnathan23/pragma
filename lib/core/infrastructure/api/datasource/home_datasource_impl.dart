import 'package:pragma_exam/core/domain/datasource/home_datasource.dart';
import 'package:pragma_exam/core/domain/entities/data/cat_entity.dart';
import 'package:pragma_exam/core/domain/enum/log_level_enum.dart';
import 'package:pragma_exam/core/infrastructure/api/api_client.dart';
import 'package:pragma_exam/share/helpers/custom_console.dart';

class HomeDatasourceImpl implements HomeDatasource {
  late final ApiClient _apiClient;

  HomeDatasourceImpl() {
    _apiClient = ApiClient();
  }

  @override
  Future<List<CatEntity>> getPortfolio({int limit = 10, int page = 0}) {
    try {
      return _apiClient.getPortfolio(limit: limit, page: page);
    } catch (e) {
      CustomConsole.log(message: 'Error in getPortfolio REST', level: LogLevel.severe, error: e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CatEntity>> searchCat({required String param}) {
    try {
      return _apiClient.searchCat(param: param);
    } catch (e) {
      CustomConsole.log(message: 'Error in searchCat REST', level: LogLevel.severe, error: e.toString());
      rethrow;
    }
  }
}
