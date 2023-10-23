import 'dart:convert';

/// An abstract class for custom error reporting.
abstract class CustomErrorReporting {
  /// Log error, warning, info, debug, trace, and fatal messages.
  ///
  /// You can provide messages for different log levels, and only messages with
  /// non-null values will be logged.
  ///
  /// [e] is for error messages.
  ///
  /// [w] is for warning messages.
  ///
  /// [i] is for info messages.
  ///
  /// [d] is for debug messages.
  ///
  /// [t] is for trace messages.
  ///
  /// [f] is for fatal messages.
  void log({String? e, String? w, String? i, String? d, String? t, String? f});

  /// Send error reports to a server.
  ///
  /// This method sends error reports to a specified [url] using the given
  /// [methodType]. Additional parameters like [headers], [body], [encoding], and
  /// [supressCustomErrors] can be specified.
  ///
  /// [url] is the target URL for sending error reports.
  ///
  /// [methodType] is the HTTP method type for the request (e.g., 'POST').
  ///
  /// [headers] are optional HTTP headers to include in the request.
  ///
  /// [body] is the request body, which can be of type [String] or [Map].
  ///
  /// [encoding] is the character encoding to use for the request.
  Future<void> sendToServer({
    required String url,
    required String methodType,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  });
}
