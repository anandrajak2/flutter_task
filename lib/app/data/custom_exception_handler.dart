class CustomException implements Exception {
  final String? code, message;

  CustomException({
    required this.message,
    this.code,
  });
}
