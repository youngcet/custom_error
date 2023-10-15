## 0.0.2

### Added
- Changed Error class to `CustomError`.

### Changed
- Improved error handling and error instance access.

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
  final error = CustomError(100, 'Error 100');
  // Check if a value is an Error instance
  bool isCustomError = error.isAnError(error);

  // Access error details
  String errorMessage = error.getError();
  int errorCode = error.getErrorCode();

  // add multiple errors
  error.addError(200, 'Error 200');

  // Retrieve all errors
  List<Map<String, dynamic>> allErrors = error.getAllErrors();

}
```
