import 'package:project_iot/enums/exception_constants.dart';
import 'package:project_iot/networks/exceptions/server_exception.dart';

class ConflictException extends ServerException {
  ConflictException(String message,int code)
      : super(message: message, type: ExceptionConstants.conflict,code: code);
  @override
  String toString() => """
  $ConflictException
  $message
  type: $type
  code: $code
  """;
}
