import 'package:pragma_exam/core/domain/entities/data/cat_entity.dart';

abstract class HomeDatasource {
  Future<List<CatEntity>> getPortfolio({int limit = 10, int page = 0});
  Future<List<CatEntity>> searchCat({required String param});
}
