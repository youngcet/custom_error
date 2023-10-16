
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
  // you can also use error.isAnError(), instead of error.hasAnError()
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

## Documentation

For detailed information on how to use the `custom_error` package, please refer to the documentation provided in the package repository or on the Flutter package website.

## License

This package is open-source and distributed under the MIT License. You are free to use it in your projects, and contributions are welcome. Please review the [LICENSE](https://github.com/youngcet/custom_error/blob/main/LICENSE) file for more details.

We hope that the `custom_error` package simplifies your error management needs in Flutter and look forward to your feedback and contributions to make it even better!