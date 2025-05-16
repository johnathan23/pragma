import 'package:pragma_exam/core/domain/entities/data/cat_entity.dart';

abstract class HomeRepository {
  Future<List<CatEntity>> getPortfolio({int limit = 10, int page = 1});
  Future<List<CatEntity>> searchCat({required String param});
}
