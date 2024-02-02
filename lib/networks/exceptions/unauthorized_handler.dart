import 'package:project_iot/networks/exceptions/exceptions.dart';


class AppExceptionHandlers {
  dynamic handleException(dynamic error)  async{
    if (error is BadRequestException) {
      return BadRequestException(error.message,error.code);
    } else if (error is NotFoundException) {
      return NotFoundException(error.message,error.code);
    } else if (error is ConflictException) {
      return ConflictException(error.message,error.code);
    } else if (error is ServerErrorException) {
      return ServerErrorException(error.message,error.code);
    } else if (error is ThresholdException) {
      return ThresholdException(error.message,error.code);
    } else if (error is UnauthorizedException) {
      return UnauthorizedException(error.message,error.code);
    }
  }
}
