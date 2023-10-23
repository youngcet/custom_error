import 'dart:convert';

import 'package:custom_error/custom_error_reporting.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'constants.dart';
import 'custom_error.dart';

/// An enumeration of text color options for styling console messages.
///
/// Use the [TextColor] enum to specify the color of text in styled console messages.
/// You can choose from options such as black, red, green, yellow, blue, magenta, cyan, and white.
enum TextColor { black, red, green, yellow, blue, magenta, cyan, white }

/// An enumeration of background color options for styling console messages.
///
/// Use the [BackgroundColor] enum to specify the background color of styled console messages.
/// Options include transparent, black, red, green, yellow, blue, magenta, cyan, and white.
enum BackgroundColor {
  transparent,
  black,
  red,
  green,
  yellow,
  blue,
  magenta,
  cyan,
  white
}

/// An enumeration of text style options for styling console messages.
///
/// Use the [TextStyle] enum to apply various styles to console messages, such as bold, underline, inverted,
/// strike-through, and blinking text.
enum TextStyle {
  bold,
  underline,
  inverted,
  strike,
  blink,
}

/// A class that defines Unicode icons for console message icons.
///
/// The [Icon] class contains static constant strings representing Unicode icons for various console messages.
/// These icons can be used to provide visual cues in styled console messages.
class Icon {
  /// Represents an information icon (ℹ️).
  static const String unicodeInfo = 'ℹ️';

  /// Represents a warning icon (⚠️).
  static const String unicodeWarning = '⚠️';

  /// Represents an error icon (❌).
  static const String unicodeError = '❌';

  /// Represents a debug icon (🐞).
  static const String unicodeDebug = '🐞';

  /// Represents a fatal error icon (💥).
  static const String unicodeFatal = '💥';

  /// Represents a trace icon (🕵️‍♂️).
  static const String unicodeTrace = '🕵️‍♂️';
}

/// A class for managing dialogs based on CustomError instances.
class CustomErrorManager implements CustomErrorReporting {
  /// Shows a dialog if an error exists in the `customError` object.
  /// This method displays an NAlertDialog with the provided `title`, `message`,
  /// and `actions` when an error is detected in the `customError` object.
  /// If `message` is not provided, it uses the error message from `customError`.
  static void showDialogIfError(BuildContext context, CustomError customError,
      String title, String? message, List<Widget>? actions) {
    String dialogMsg = message ?? customError.getError();

    if (customError.hasAnError()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return NAlertDialog(
            dialogStyle: DialogStyle(titleDivider: true),
            title: Text(title),
            content: Text(dialogMsg),
            actions: actions,
          );
        },
      );
    }
  }

  /// Shows a SnackBar if an error exists in the `customError` object.
  ///
  /// This method displays a SnackBar with the error message from the `customError` object.
  /// You can provide custom `backgroundColor` and `behavior` for the SnackBar.
  static void showSnackBarIfError(BuildContext context, CustomError customError,
      {Color? backgroundColor, SnackBarBehavior? behavior}) {
    if (customError.hasAnError()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(customError.getError()),
          behavior: behavior ?? SnackBarBehavior.fixed,
          backgroundColor: backgroundColor ?? Colors.black,
        ),
      );
    }
  }

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
  @override
  void log({String? e, String? w, String? i, String? d, String? t, String? f}) {
    DateTime now = DateTime.now();
    final String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    if ((e != null ? 1 : 0) +
            (w != null ? 1 : 0) +
            (i != null ? 1 : 0) +
            (d != null ? 1 : 0) +
            (t != null ? 1 : 0) +
            (f != null ? 1 : 0) !=
        1) {
      _printTextWithIcon(
        CustomErrorConstants.LOGGING_ERROR,
        TextColor.red,
        BackgroundColor.transparent,
        Icon.unicodeError,
        TextStyle.blink,
        paddingLeft: 2, // Left padding
        paddingTop: 10, // Top padding
        paddingRight: 2, // Right padding
        paddingBottom: 10, // Bottom padding
      );
    }

    if (e != null) {
      _printTextWithIcon(
        '$formattedDate ${CustomErrorConstants.CUSTOM_ERROR}: [Error] $e',
        TextColor.red,
        BackgroundColor.transparent,
        Icon.unicodeError,
        TextStyle.blink,
        paddingLeft: 2, // Left padding
        paddingTop: 10, // Top padding
        paddingRight: 2, // Right padding
        paddingBottom: 10, // Bottom padding
      );
    }

    if (w != null) {
      _printTextWithIcon(
        '$formattedDate ${CustomErrorConstants.CUSTOM_ERROR}: [Warning] $w',
        TextColor.yellow,
        BackgroundColor.transparent,
        Icon.unicodeWarning,
        TextStyle.blink,
        paddingLeft: 2, // Left padding
        paddingTop: 10, // Top padding
        paddingRight: 2, // Right padding
        paddingBottom: 10, // Bottom padding
      );
    }

    if (i != null) {
      _printTextWithIcon(
        '$formattedDate ${CustomErrorConstants.CUSTOM_ERROR}: [Info] $i',
        TextColor.blue,
        BackgroundColor.transparent,
        Icon.unicodeInfo,
        TextStyle.blink,
        paddingLeft: 2, // Left padding
        paddingTop: 10, // Top padding
        paddingRight: 2, // Right padding
        paddingBottom: 10, // Bottom padding
      );
    }

    if (d != null) {
      _printTextWithIcon(
        '$formattedDate ${CustomErrorConstants.CUSTOM_ERROR}: [Debug] $d',
        TextColor.blue,
        BackgroundColor.transparent,
        Icon.unicodeDebug,
        TextStyle.blink,
        paddingLeft: 2, // Left padding
        paddingTop: 10, // Top padding
        paddingRight: 2, // Right padding
        paddingBottom: 10, // Bottom padding
      );
    }

    if (t != null) {
      _printTextWithIcon(
        '$formattedDate ${CustomErrorConstants.CUSTOM_ERROR}: [Trace] $t',
        TextColor.cyan,
        BackgroundColor.transparent,
        Icon.unicodeTrace,
        TextStyle.blink,
        paddingLeft: 2, // Left padding
        paddingTop: 10, // Top padding
        paddingRight: 2, // Right padding
        paddingBottom: 10, // Bottom padding
      );
    }

    if (f != null) {
      _printTextWithIcon(
        '$formattedDate ${CustomErrorConstants.CUSTOM_ERROR}: [Fatal] $f',
        TextColor.red,
        BackgroundColor.transparent,
        Icon.unicodeFatal,
        TextStyle.blink,
        paddingLeft: 2, // Left padding
        paddingTop: 10, // Top padding
        paddingRight: 2, // Right padding
        paddingBottom: 10, // Bottom padding
      );
    }
  }

  /// A private method for printing styled console messages with icons.
  ///
  /// The [_printTextWithIcon] method formats and prints a styled console message with an icon, text color, background color,
  /// and optional text style, padding, and line breaks. It is used to enhance the visual presentation of log messages in the console.
  ///
  /// - [message]: The text message to be displayed in the console.
  /// - [textColor]: The color of the text in the console message.
  /// - [bgColor]: The background color for the console message.
  /// - [icon]: The Unicode icon associated with the message type.
  /// - [style]: The text style applied to the console message.
  /// - [paddingLeft]: The left padding in spaces added to the message.
  /// - [paddingTop]: The top padding in empty lines added before the message.
  /// - [paddingRight]: The right padding in spaces added to the message.
  /// - [paddingBottom]: The bottom padding in empty lines added after the message.
  ///
  /// The method calculates the styles and formatting based on the provided parameters and then prints the styled message to the console.
  void _printTextWithIcon(
    String message,
    TextColor textColor,
    BackgroundColor bgColor,
    String icon,
    TextStyle style, {
    int paddingLeft = 0,
    int paddingTop = 0,
    int paddingRight = 0,
    int paddingBottom = 0,
  }) {
    final Map<TextColor, String> textColorCodes = {
      TextColor.black: '30',
      TextColor.red: '31',
      TextColor.green: '32',
      TextColor.yellow: '33',
      TextColor.blue: '34',
      TextColor.magenta: '35',
      TextColor.cyan: '36',
      TextColor.white: '37',
    };

    final Map<BackgroundColor, String> bgColorCodes = {
      BackgroundColor.transparent: '0',
      BackgroundColor.black: '40',
      BackgroundColor.red: '41',
      BackgroundColor.green: '42',
      BackgroundColor.yellow: '43',
      BackgroundColor.blue: '44',
      BackgroundColor.magenta: '45',
      BackgroundColor.cyan: '46',
      BackgroundColor.white: '47',
    };

    const String resetCode = '\u001b[0m';

    final String coloredMessage =
        '\u001b[${bgColorCodes[bgColor]};${textColorCodes[textColor]}m $icon $message $resetCode';

    final String dash =
        "\u001b[${textColorCodes[textColor]};${textColorCodes[textColor]}m - $resetCode";

    // Create the styled message with padding.
    final leftPadding = ' ' * paddingLeft;
    final rightPadding = ' ' * paddingRight;
    final paddedMessage =
        '\u001b[${style}m$leftPadding$coloredMessage$rightPadding\u001b[0m';

    // Add top and bottom padding.
    final lines = paddedMessage.split('\n');
    final paddedLines = List.generate(
      paddingTop,
      (index) =>
          ' ' *
          (leftPadding.length + paddedMessage.length + rightPadding.length),
    )
      ..addAll(lines)
      ..addAll(List.generate(
          paddingBottom,
          (index) =>
              ' ' *
              (leftPadding.length +
                  paddedMessage.length +
                  rightPadding.length)));

    final paddedText = paddedLines.join('\n');
    String multipliedChar = '';
    for (int i = 0; i < 30; i++) {
      multipliedChar += dash;
    }

    print('$multipliedChar$paddedText\n$multipliedChar');
  }

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
  @override
  Future<void> sendToServer(
      {required String url,
      required String methodType,
      Map<String, String>? headers,
      Object? body,
      Encoding? encoding}) async {
    final uri = Uri.parse(url);

    if (methodType.toLowerCase() == CustomErrorConstants.POST) {
      final response = await http.post(uri,
          headers: headers ?? {}, body: body, encoding: encoding ?? utf8);

      _isStatusOk(response);
    } else if (methodType.toLowerCase() == CustomErrorConstants.GET) {
      final response = await http.get(
        uri,
        headers: headers ?? {},
      );

      _isStatusOk(response);
    } else {
      _printTextWithIcon(
        '${CustomErrorConstants.CUSTOM_ERROR}: methodType not supported.',
        TextColor.red,
        BackgroundColor.transparent,
        Icon.unicodeError,
        TextStyle.blink,
        paddingLeft: 2, // Left padding
        paddingTop: 10, // Top padding
        paddingRight: 2, // Right padding
        paddingBottom: 10, // Bottom padding
      );
    }
  }

  /// Sends a log message via email to the specified recipient.
  ///
  /// The [emailLog] method sends an email containing the [message] to the specified [recipient].
  /// It includes a subject indicating the application title and identifies the message as a custom error log.
  ///
  /// - [message]: The log message to be sent via email.
  /// - [recipient]: The recipient's email address.
  /// - [appTitle]: The title of the application, used as part of the email subject.
  ///
  /// This method posts the log message to the specified server URL using an HTTP POST request.
  /// It includes necessary headers and JSON-encoded data. After sending the message, it checks the response status
  /// using [_isStatusOk] and logs the result.
  Future<void> emailLog(
      {required String message,
      required String recipient,
      required String appTitle}) async {
    final url = Uri.parse(CustomErrorConstants.SERVER_URL);

    var data = {
      'messages': {
        'recipient': recipient,
        'subject': '${CustomErrorConstants.CUSTOM_ERROR} - $appTitle',
        'message': message,
        'from': CustomErrorConstants.NO_REPLY_EMAIL,
        'replytoName': 'Custom Error',
        'fromName': 'no-reply',
        'replyto': CustomErrorConstants.NO_REPLY_EMAIL,
      },
    };

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'APIKEY': CustomErrorConstants.APP_API_KEY
      },
      body: jsonEncode(data),
    );

    _isStatusOk(response);
  }

  /// Checks the status of an HTTP response and logs the result.
  ///
  /// The [_isStatusOk] method takes an HTTP response [status] and checks if its status code is 200 (OK).
  /// If the status code is 200, it returns `true`, indicating that the response is successful.
  /// If the status code is not 200, it returns `false`, indicating an unsuccessful response.
  ///
  /// The method also logs information about the response, including the timestamp, CustomError message type,
  /// and the response body in the console. This information is presented in a styled format.
  ///
  /// - [status]: The HTTP response whose status is to be checked.
  ///
  /// Returns `true` if the status code is 200; otherwise, returns `false`.
  bool _isStatusOk(dynamic status) {
    DateTime now = DateTime.now();
    final String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    _printTextWithIcon(
      '$formattedDate ${CustomErrorConstants.CUSTOM_ERROR} HTTPS Response: ${status.body}',
      TextColor.magenta,
      BackgroundColor.transparent,
      Icon.unicodeInfo,
      TextStyle.blink,
      paddingLeft: 2, // Left padding
      paddingTop: 10, // Top padding
      paddingRight: 2, // Right padding
      paddingBottom: 10, // Bottom padding
    );

    return (status.statusCode == 200) ? true : false;
  }
}
