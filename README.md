
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
- **Show dialogs** with custom titles, messages, and actions when an error occurs.
- **Display SnackBars** with custom backgrounds and behaviors based on error conditions.

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

### Showing a Dialog / SnackBar when an error occurs using CustomErrorManager

#### Error Dialog

![Custom Error Dialog](https://permanentlink.co.za/img/customerrordialog.png)

```dart
import 'package:custom_error/custom_error.dart';

...
...
  ElevatedButton(
    onPressed: (){
      CustomError customError = CustomError();
      customError.setError(-1, 'Showing Error Dialog');

      // add dialog buttons
      final actions = <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            // add code logic for the button
          },
          child: Text('OK'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            // add code logic for the button
          },
          child: Text('Cancel'),
        )
      ];

      // Show a dialog when an error occurs
      CustomErrorManager.showDialogIfError(
        context,
        customError,
        "Error Title",
        "Optional error message", // if set to null, customError.getError() message will be used
        actions,
      );
    },
    child: Text('Show Error Dialog'),
  ),
  ...
  ...
```

#### Error SnackBar

![Custom Error SnackBar](https://permanentlink.co.za/img/customerrorsnackbar.png)

```dart
import 'package:custom_error/custom_error.dart';

...
...
  ElevatedButton(
    onPressed: (){
      CustomError customError = CustomError();
      customError.setError(-1, 'Showing Error SnackBar');

      // Display a SnackBar when an error occurs
      CustomErrorManager.showSnackBarIfError(
        context,
        customError,
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      );
    },
    child: Text('Show Error SnackBar'),
  )
  ...
  ...
```

## Documentation

For detailed information on how to use the `custom_error` package, please refer to the documentation provided in the package repository or on the Flutter package website.

## License

This package is open-source and distributed under the MIT License. You are free to use it in your projects, and contributions are welcome. Please review the [LICENSE](https://github.com/youngcet/custom_error/blob/main/LICENSE) file for more details.

We hope that the `custom_error` package simplifies your error management needs in Flutter and look forward to your feedback and contributions to make it even better!