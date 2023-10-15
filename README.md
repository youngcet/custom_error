# Custom Error Management for Dart

The "custom_error" library is a powerful Dart package designed to streamline error management and elevate error handling in your Dart applications. This package offers a single class, `Error`, which empowers developers to create, store, and access custom error instances with ease. Key features of the "custom_error" package include:

## Features

* Custom Error Management: The Error class allows you to create and manage custom error objects with both error codes and messages. This is particularly valuable for precise error tracking within your application.

* Flexible Error Storage: The library includes a list of maps to store error details, enabling you to accumulate multiple errors and access them as needed.

* Error Retrieval: Convenient getter methods, such as **getError()** and **getErrorCode()**, facilitate easy access to individual error details.

* Comprehensive Error Access: The **getAllErrors()** method enables you to access the entire list of errors, making it helpful for debugging and reporting.

* Type Checking: The **isAnError()** method allows you to determine whether a given value is an instance of the Error class.

## Getting started

### Installation

To use the "custom_error" package in your Dart project, add it to your pubspec.yaml file as a dependency:

```yaml
dependencies:
  custom_error: ^0.0.1
```

## Usage

```dart
import 'package:custom_error/custom_error.dart';

void main() {
  // Create and manage custom errors
  final error;

  String name = 'Yung';
  if (name !== 'Yung'){
    error = Error(100, 'Name Incorrect.');
  }

  // Check if a value is an Error instance
  if (error.isAnError(error)){
    // handle error
    // Access error details
    String errorMessage = error.getError();
    int errorCode = error.getErrorCode();

    // print(errorMessage); > Name Incorrect.
    // print('$errorCode');    > 100
  }

  // setting multiple errors
  error.addError(200, 'This is another error.');
  // Retrieve all errors
  List<Map<String, dynamic>> allErrors = error.getAllErrors();
  //print(allErrors);   > [{'code': 100, 'error': 'Name Incorrect.'}, {'code': 200, 'error': 'This is another error.'}]
}
```

The "custom_error" library is a robust and user-friendly solution for error handling in your Dart applications. It empowers you to create clear and concise error messages and codes while accumulating them for future reference or reporting. Simplify your error management with "custom_error."

## License

This package is open-source and distributed under the MIT License. Feel free to use it in your projects, and contributions are welcome!