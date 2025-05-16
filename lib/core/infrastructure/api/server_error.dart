import 'package:dio/dio.dart';
import 'package:pragma_exam/core/domain/enum/log_level_enum.dart';
import 'package:pragma_exam/share/helpers/custom_console.dart';

class ServerError implements Exception {
  int? _errorCode;
  String? _errorMessage;

  void catchError({required DioException error, String? nameApi}) {
    _handleError(error);
    CustomConsole.log(message: 'error code: $_errorCode, error message: $_errorMessage', level: LogLevel.info);
  }

  int? get errorCode => _errorCode;
  String? get errorMsg => _errorMessage;

  void _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        _errorMessage = 'Petición cancelada.';
        break;

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        _errorMessage = 'El tiempo de conexión expiró.';
        break;

      case DioExceptionType.badCertificate:
        _errorMessage = 'Los certificados están mal.';
        break;

      case DioExceptionType.connectionError:
        _errorMessage = 'El servidor no se encuentra encendido.';
        break;

      case DioExceptionType.unknown:
        _errorMessage = error.message;
        break;

      case DioExceptionType.badResponse:
        _errorCode = error.response?.statusCode;
        _errorMessage = _validateErrorCodes(_errorCode ?? 0);
        break;
    }
  }

  String _validateErrorCodes(int errorCode) {
    switch (errorCode) {
      case 0:
        return 'El response está vacío.';
      case 400:
        return 'Lo sentimos, ha ocurrido un error.';
      case 401:
        return 'Sin autorización.';
      case 403:
        return 'Acceso restringido.';
      case 404:
        return 'No encontrado.';
      case 500:
        return 'Se ha presentado un error en el servidor, por favor, inténtelo más tarde. Si el error persiste, por favor comuníquese con nosotros.';
      default:
        return "Código de respuesta recibido: $errorCode.";
    }
  }
}
