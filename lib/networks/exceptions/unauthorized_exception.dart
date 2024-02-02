import 'package:project_iot/enums/exception_constants.dart';
import 'package:project_iot/networks/exceptions/server_exception.dart';

class UnauthorizedException extends ServerException {
  UnauthorizedException(String message,int code)
      : super(message: message, type: ExceptionConstants.unauthorized,code: code);
  @override
  String toString() => """
  $UnauthorizedException
  $message
  type: $type
  code: $code
  """;
}
