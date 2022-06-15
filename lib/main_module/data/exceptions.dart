class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

class LocalDBException implements Exception {
  final String message;
  LocalDBException(this.message);
}
