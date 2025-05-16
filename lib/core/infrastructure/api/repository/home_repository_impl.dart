import 'package:pragma_exam/core/domain/datasource/home_datasource.dart';
import 'package:pragma_exam/core/domain/entities/data/cat_entity.dart';
import 'package:pragma_exam/core/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource _homeDatasourceImpl;

  HomeRepositoryImpl(this._homeDatasourceImpl);

  @override
  Future<List<CatEntity>> getPortfolio({int limit = 10, int page = 1}) {
    return _homeDatasourceImpl.getPortfolio(limit: limit, page: page);
  }

  @override
  Future<List<CatEntity>> searchCat({required String param}) {
    return _homeDatasourceImpl.searchCat(param: param);
  }
}
