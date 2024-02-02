class ServerException implements Exception {
  final String type;
  final String message;
  final int code;
  ServerException({required this.message, required this.type,required this.code});
  @override
  String toString() => """
  $ServerException
  $message
  type: $type
  code: $code
  """;
}