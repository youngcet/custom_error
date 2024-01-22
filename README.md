
# custom_error

A Flutter package for custom error management.

[![Pub Version](https://img.shields.io/pub/v/custom_error)](https://pub.dev/packages/custom_error)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/youngcet/custom_error/blob/main/LICENSE)

## Overview

The `custom_error` library is designed to simplify error management in your Flutter applications. It provides a versatile `CustomError` class that allows you to create, store, and access custom error instances with ease.

### Key Features

- **Custom Error Management:** Create and manage custom error objects with error codes and messages.
- **Flexible Error Storage:** Store multiple errors using a list of maps.
- **Error Retrieval:** Easily access individual error details using getter methods.
- **Error State Check:** Check if an error exists with the `hasAnError()` method.
- **Type Checking:** Determine if an object is an instance of `CustomError` using the `isAnError()` method.
- **Show Dialogs** with custom titles, messages, and actions when an error occurs.
- **Display SnackBars** with custom backgrounds and behaviors based on error conditions.
- **Error Logging** report errors to a remote server / email / log for further analysis. This can help in identifying and fixing issues in production.
- **Colored Console Messages** display different color messages based on the error level

## Installation

To use the `custom_error` package in your Flutter project, add it to your `pubspec.yaml` file as a dependency:

```yaml
dependencies:
  custom_error: ^latest_version
```

Replace `^latest_version` with the specific version you want to use, and then run `flutter pub get` to fetch and install the package.

## Usage

Here's an example of how you can use the `custom_error` package in your Flutter application:

```dart
import 'package:custom_error/custom_error.dart';

void main() {
  String _inputText = 'Mazzi';
  List<String> names = ['Yung', 'Cet', 'Cedric'];

  // Create and manage custom errors
  CustomError error = CustomError();
  if (! names.contains(_inputText)){
    error.setError(-1, 'Name not found.');
  }

  // Check if an error exists
  // You can also use error.isAnError(), instead of error.hasAnError()
  // To display a dialog / snackbar when an error has occured use CustomErrorManager, see examples below
  if (error.hasAnError()) {
    // handle error
    print('Error: ${error.getError()}, Code: ${error.getErrorCode()}');
  } else {
    print('No error found.');
  }

  // Add multiple errors
  error.addError(200, 'Error 200');
  error.addError(300, 'Error 300');

  // Retrieve all errors
  final allErrors = error.getAllErrors();

  // Check if an error exists
  if (error.isAnError()) {
    print('All Errors: $allErrors');
  } else {
    print('No error found.');
  }
}
```

## CustomErrorManager Class

The `CustomErrorManager` class is used to manage dialogs based on `CustomError` instances. It provides methods for displaying dialogs and SnackBars if an error exists in the `CustomError` object. You can also use it to log messages at different levels.

### Show Dialog If Error

The `showDialogIfError` method displays an `NAlertDialog` if an error exists in the `customError` object. You can provide a `title`, `message`, and `actions` to customize the dialog.

![Custom Error Dialog](https://permanentlink.co.za/img/customerrordialog.png)

```dart
CustomError customError = CustomError();
customError.setError(-1, 'Showing Error Dialog');

// add dialog buttons
final actions = <Widget>[
  TextButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
    child: Text('OK'),
  ),
  TextButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
    child: Text('Cancel'),
  )
];

CustomErrorManager.showDialogIfError(
    context, 
    customError, 
    'Error Dialog', 
    null, // when null is set, customError.getError() is used
    actions
);
```

### Show SnackBar If Error

The `showSnackBarIfError` method displays a SnackBar if an error exists in the `customError` object. You can customize the SnackBar with options like `backgroundColor` and `behavior`.

![Custom Error SnackBar](https://permanentlink.co.za/img/customerrorsnackbar.png)

```dart
CustomError customError = CustomError();
customError.setError(-1, 'Showing Error SnackBar');
CustomErrorManager.showSnackBarIfError(
    context, customError,
    behavior: SnackBarBehavior.fixed);
```

### Log Messages

The `log` method is used to log error, warning, info, debug, trace, and fatal messages. You can provide messages for different log levels, and only messages with non-null values will be logged.

```dart
CustomErrorManager customErrorManager = CustomErrorManager();
// logging a warning message
customErrorManager.log(w: 'Warning Message');

// logging an error message
customErrorManager.log(e: 'Error Message');

// logging an info message
customErrorManager.log(i: 'Info Message');

// logging a debug message
customErrorManager.log(d: 'Debug Message');

// logging a fatal message
customErrorManager.log(f: 'Fatal Message');

// logging a trace message
customErrorManager.log(t: 'Trace Message');
```

### Send Error Reports to Server

The `sendToServer` method sends error reports to a specified URL using a specified HTTP method. You can include optional parameters like `headers`, `body`, and `encoding`.

```dart
final data = {}; // data to post
CustomErrorManager customErrorManager = CustomErrorManager();
await customErrorManager.sendToServer(
   url: 'url', // endpoint
   methodType: 'post', // method type (Only POST && GET supported)
   headers: <String, String>{    // headers
     'Content-Type': 'application/json',
   },
   body: jsonEncode(data) // encode the data
 );
```

### Email Log

The `emailLog` method sends a log message via email (using CustomManager's email service) to the specified recipient. It includes the log message, recipient's email address, and application title in the email subject.

```dart
CustomErrorManager customErrorManager = CustomErrorManager();
await customErrorManager.emailLog(
  message: 'An error has occured',
  recipient: 'recipient@example.com', // you can add multiple recipients by , separating (e.g. recipient1,recipient2)
  appTitle: 'Custom Error Demo'
);
```

## Examples

Here are some examples of how to use the Custom Error Reporting library in your Dart application:

```dart
// Log an error message
CustomErrorManager.log(e: 'This is an error message');

// Show a dialog if an error exists
CustomError customError = CustomError();
customError.setError(-1, 'An error occured.');
CustomErrorManager.showDialogIfError(context, customError, 'Error', 'An error occurred', null);

// Show a SnackBar if an error exists
CustomErrorManager.showSnackBarIfError(context, customError, backgroundColor: Colors.red);

// Send an error report to a server
CustomErrorManager.sendToServer(url: 'https://example.com/report', methodType: 'POST', body: 'Report data');

// Email a log message
CustomErrorManager.emailLog(message: 'Error message', recipient: 'recipient@example.com', appTitle: 'My App');
```

## Documentation

For detailed information on how to use the `custom_error` package, please refer to the documentation provided in the package repository or on the Flutter package website.

## License

This package is open-source and distributed under the MIT License. You are free to use it in your projects, and contributions are welcome. Please review the [LICENSE](https://github.com/youngcet/custom_error/blob/main/LICENSE) file for more details.

We hope that the `custom_error` package simplifies your error management needs in Flutter and look forward to your feedback and contributions to make it even better!