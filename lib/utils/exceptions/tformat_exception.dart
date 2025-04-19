class TFormatException implements Exception {
  final String message;

  TFormatException([this.message = 'Invalid format. Please try again.']);

  @override
  String toString() => message;
}
