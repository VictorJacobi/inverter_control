import 'package:project_iot/enums/exception_constants.dart';
import 'package:project_iot/networks/exceptions/server_exception.dart';

class NotFoundException extends ServerException{
  NotFoundException(String message,int code):
      super(message:  message,type:  ExceptionConstants.notFound,code: code,);
  @override
  String toString() => """
  $NotFoundException
  $message
  type: $type
  code: $code
  """;
}