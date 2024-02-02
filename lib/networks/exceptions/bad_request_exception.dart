

import 'package:project_iot/enums/exception_constants.dart';
import 'package:project_iot/networks/exceptions/server_exception.dart';

class BadRequestException extends ServerException {
  BadRequestException(String message,int code)
      : super(
    message: message,
    type: ExceptionConstants.badRequest,
    code: code,
  );
  @override
  String toString() => """
  $BadRequestException
  $message
  type: $type
  code: $code
  """;
}