import 'package:project_iot/enums/exception_constants.dart';
import 'package:project_iot/networks/exceptions/server_exception.dart';

class ThresholdException extends ServerException{
  ThresholdException(String message,int code):
      super(message: message,type: ExceptionConstants.thresholdLimit,code: code);
  @override
  String toString() => """
  $ThresholdException
  $message
  type: $type
  code: $code
  """;
}