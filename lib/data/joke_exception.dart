class JokesException implements Exception {
  final String message;
  JokesException(this.message);

  String toString() {
    if (message == null) return "Exception";
    return "Exception: $message";
  }
}