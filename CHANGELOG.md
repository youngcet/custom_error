## 0.0.1

# Initial Release Changelog

We are excited to announce the initial release of the "custom_error" package. This release marks the beginning of a new era in error management for Dart developers. "custom_error" empowers you to create, store, and access custom error instances with ease, making error handling more efficient and effective in your Dart applications.

## Key Features

- **Custom Error Management:** Create and manage custom error objects with error codes and messages.
- **Flexible Error Storage:** Store multiple errors using a list of maps.
- **Error Retrieval:** Easily access individual error details using getter methods.
- **Comprehensive Error Access:** Retrieve all errors for debugging and reporting.
- **Type Checking:** Verify if a value is an instance of the `Error` class.

## Usage Example

```dart
import 'package:custom_error/custom_error.dart';

void main() {
  // Create and manage custom errors
  final error = Error(100, 'Error 100');
  error.addError(200, 'Error 200');

  // Access error details
  String errorMessage = error.getError();
  int errorCode = error.getErrorCode();

  // Retrieve all errors
  List<Map<String, dynamic>> allErrors = error.getAllErrors();

  // Check if a value is an Error instance
  bool isCustomError = error.isAnError(error);
}
```
