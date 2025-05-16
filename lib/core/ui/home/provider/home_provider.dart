import 'package:dio/dio.dart';
import 'package:pragma_exam/core/domain/datasource/home_datasource.dart';
import 'package:pragma_exam/core/domain/entities/data/cat_entity.dart';
import 'package:pragma_exam/core/domain/repositories/home_repository.dart';
import 'package:pragma_exam/core/infrastructure/api/repository/home_repository_impl.dart';
import 'package:pragma_exam/core/infrastructure/api/datasource/home_datasource_impl.dart';
import 'package:pragma_exam/core/infrastructure/api/server_error.dart';
import 'package:pragma_exam/core/ui/home/provider/state/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@riverpod
class Home extends _$Home {
  @override
  HomeState build() => HomeState();

  HomeRepository get _homeRepository {
    final HomeDatasource dataSource = HomeDatasourceImpl();
    return HomeRepositoryImpl(dataSource);
  }

  Future<void> getPortfolio({required int limit, required int page}) async {
    try {
      state = state.copyWith(isLoading: true);
      final List<CatEntity> catList = await _homeRepository.getPortfolio(limit: limit, page: page);
      state = state.copyWith(catList: catList);
      state = state.copyWith(isLoading: false);
    } catch (error) {
      if (error.runtimeType == DioException) {
        final ServerError serverError = ServerError();
        serverError.catchError(error: error as DioException, nameApi: 'getPortfolio');
        state = state.copyWith(isLoading: false, dioError: serverError.errorMsg);
      } else {
        state = state.copyWith(isLoading: false, hasError: error.toString());
        throw Exception('Fail to get portfolio in Home Provider: $error');
      }
    }
  }

  Future<void> searchCat(String param) async {
    try {
      state = state.copyWith(isLoading: true);
      final List<CatEntity> catList = await _homeRepository.searchCat(param: param);
      state = state.copyWith(catList: catList);
      state = state.copyWith(isLoading: false);
    } catch (error) {
      if (error.runtimeType == DioException) {
        final ServerError serverError = ServerError();
        serverError.catchError(error: error as DioException, nameApi: 'searchCat');
        state = state.copyWith(isLoading: false, dioError: serverError.errorMsg);
      } else {
        state = state.copyWith(isLoading: false, hasError: error.toString());
        throw Exception('Fail to search cat in Home Provider: $error');
      }
    }
  }
}
