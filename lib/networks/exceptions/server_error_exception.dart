import 'package:project_iot/enums/exception_constants.dart';
import 'package:project_iot/networks/exceptions/server_exception.dart';

class ServerErrorException extends ServerException {
  ServerErrorException(String message,int code)
      : super(
    message: message,
    type: ExceptionConstants.internalServerError,
    code: code,
  );
  @override
  String toString() => """
  $ServerErrorException
  $message
  type: $type
  code: $code
  """;
}